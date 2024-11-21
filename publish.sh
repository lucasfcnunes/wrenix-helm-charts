#/bin/sh

HELM_REPO=${HELM_REPO:-codeberg.org/wrenix/helm-charts}
HELM_REPO_URL="oci://${HELM_REPO}"
COMMIT_SCOPE=${2:-fix}
COMMIT_MESSAGE=${1:-"update appVersion"}



ct lint # || exit 1

for p in * ; do
  if \
    [ ! -d $p ] || \
    [ $p == docs ] || \
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
        echo
        continue;
      fi
    else
      echo "nothing todo"
      echo
      continue;
    fi
  fi

  set -e
  echo "update docs"
  helm-docs -t ./README.md.gotmpl -t _docs.gotmpl -o README.md -g "${p}"
  rm -f "${p}/README.adoc"
  echo

  echo "package and push helm-chart"
  helm package "${p}"
  helm push "${p}-${v}.tgz" "${HELM_REPO_URL}";
  oras tag "${HELM_REPO}/${p}:${v}" "${v%\.[0-9]*}" "${v%\.[0-9]*\.[0-9]*}" "latest"
  echo

  echo "update artifacthub.io"
  set +e
  oras push "${HELM_REPO}/${p}:artifacthub.io" \
    --config /dev/null:application/vnd.cncf.artifacthub.config.v1+yaml \
    "${p}/artifacthub-repo.yml":application/vnd.cncf.artifacthub.repository-metadata.layer.v1.yaml
  echo

  echo "push to git"
  git add "${p}/"
  git commit -m "${COMMIT_SCOPE}(${p}): ${COMMIT_MESSAGE}"
  set -e
  git tag "${tag}" --no-sign;
  git push --tags origin main;
  set +e

  echo
done
