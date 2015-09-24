#!/bin/sh

for i in $(ls *.thy); do
  sed -i -e 's#linksem/src/abis/aarch64#linksem/auto_generated/isabelle#g' $i
  sed -i -e 's#linksem/src/abis/amd64#linksem/auto_generated/isabelle#g' $i
  sed -i -e 's#linksem/src/abis/power64#linksem/auto_generated/isabelle#g' $i
  sed -i -e 's#linksem/src/abis/x86#linksem/auto_generated/isabelle#g' $i
  sed -i -e 's#linksem/src/abis#linksem/auto_generated/isabelle#g' $i
  sed -i -e 's#linksem/src/adaptors#linksem/auto_generated/isabelle#g' $i
  sed -i -e 's#linksem/src/gnu_extensions#linksem/auto_generated/isabelle#g' $i
  sed -i -e 's#linksem/src#linksem/auto_generated/isabelle#g' $i
  sed -i -e 's#$ISABELLE_HOME/auto_generated/isabelle#$ISABELLE_HOME/src/#g' $i
done
