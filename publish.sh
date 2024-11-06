#/bin/sh

HELM_REPO=${HELM_REPO:-codeberg.org/wrenix/helm-charts}
HELM_REPO_URL="oci://${HELM_REPO}"
COMMIT_SCOPE=${2:-fix}
COMMIT_MESSAGE=${1:-"update appVersion"}



ct lint # || exit 1

for p in * ; do
  if \
    [ ! -d $p ] || \
    [ ! -f $p/Chart.yaml ] \
    ; then
    continue
  fi

  echo "${p}:";

  # last pkg  
  lastTag=$(git tag -l "${p}-v*" | sort --sort=version | tail -1)
  lastVersion=${lastTag#${p}-v}
  echo "last pkg: ${lastVersion}"

  # Chart version
  v=$(dasel -f "${p}/Chart.yaml" -s version)
  echo "version: ${v}";

  #  should be increased?
  tag="${p}-v${v}"
  # check if a old version exists
  if [ ! $lastTag == '' ]; then
  
    # check if changes since new version happen
    changes=$(git diff "${lastTag}" -- "${p}" | wc -l);
    if [ "$changes" -gt "0" ]; then
      # check / lint if version was increased correct
      if [ "$tag" == "$lastTag" ]; then
        echo "changed helmchart should create new pkg - diff line count has:"
        echo $(git diff "${lastTag}" -- "${p}" | wc -l);
        exit 1
      fi
    else
      echo "nothing todo"
      echo
      continue;
    fi
  fi

  helm-docs -t ./README.md.gotmpl -t _docs.gotmpl -o README.md -g "${p}"
  helm-docs -t ./README.adoc.gotmpl -t _docs.gotmpl -o README.adoc -g "${p}"

  helm package "${p}"
  helm push "${p}-${v}.tgz" "${HELM_REPO_URL}";

  oras push "${HELM_REPO}/${p}:artifacthub.io" \
    --config /dev/null:application/vnd.cncf.artifacthub.config.v1+yaml \
    "${p}/artifacthub-repo.yml":application/vnd.cncf.artifacthub.repository-metadata.layer.v1.yaml

  git add "${p}/" "docs/modules/charts/nav.adoc" "docs/modules/charts/pages/${p}.adoc"
  git commit -m "${COMMIT_SCOPE}(${p}): ${COMMIT_MESSAGE}"
  git tag "${tag}" --no-sign;
  git push --tags origin main;

  echo
done
