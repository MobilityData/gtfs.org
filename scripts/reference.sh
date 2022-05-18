rm -r docs/temp/*.md
gcsplit --prefix='ref' --suffix-format='%02d.md' docs/schedule/reference.md /^'#'/ "{*}"
mv ref* docs/temp
rm -r docs/temp/ref00.md
yarn run simpleen translate


cat docs/temp/*.fr.md > docs/schedule/reference.fr.md

for f in docs/temp/*.fr.md; do (cat "${f}"; echo) >> docs/schedule/reference.fr.md; done
