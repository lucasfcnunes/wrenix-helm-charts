#!/bin/sh
ROOT_DIR="./docs/modules/charts/"

rm "${ROOT_DIR}/pages/"*".adoc"

echo "* charts" > "${ROOT_DIR}/nav.adoc"
for name in * ; do
  if \
    [ ! -d $name ] || \
    [ ! -f $name/Chart.yaml ] \
    ; then
    continue;
  fi
  ln -sf "../../../../${name}/README.adoc" "${ROOT_DIR}/pages/${name}.adoc";
  echo "** xref:${name}.adoc[${name}]" >> "${ROOT_DIR}/nav.adoc"
done
