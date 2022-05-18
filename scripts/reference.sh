rm -r docs/temp/*.md
gcsplit --prefix='ref' --suffix-format='%02d.md' docs/schedule/reference.md /^'#'/ "{*}"
mv ref* docs/temp
rm -r docs/temp/ref00.md

