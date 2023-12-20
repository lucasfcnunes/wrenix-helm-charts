#!/bin/sh
ROOT_DIR="./docs/modules/charts/"

echo "* charts" > "${ROOT_DIR}/nav.adoc"
for name in * ; do
  [ ! -d $name ] && continue
  [ $name == "docs" ] && continue
  ln -sf "../../../../${name}/README.adoc" "${ROOT_DIR}/pages/${name}.adoc";
  echo "** xref:${name}.adoc[${name}]" >> "${ROOT_DIR}/nav.adoc"
done
