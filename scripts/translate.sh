# TRANSLATIONS

## Remove previously translated files
find . -name "*.id.md" -type f -delete
find . -name "*.de.md" -type f -delete
find . -name "*.es.md" -type f -delete
find . -name "*.fr.md" -type f -delete
find . -name "*.pt_BR.md" -type f -delete
find . -name "*.ru.md" -type f -delete
find . -name "*.zh.md" -type f -delete
find . -name "*.ja.md" -type f -delete
find . -name "*.ko.md" -type f -delete

## docs/*.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/*.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/$FILE.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/schedule/*.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/schedule/*.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/schedule/$FILE.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/schedule/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/schedule/changes/index.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/schedule/changes/index.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/schedule/changes/index.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/schedule/changes/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/schedule/examples/index.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/schedule/examples/index.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/schedule/examples/index.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/schedule/examples/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/realtime/*.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/realtime/*.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/realtime/$FILE.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/realtime/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/realtime/changes/index.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/realtime/changes/index.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/realtime/changes/index.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/realtime/changes/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/realtime/code-examples/*.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/realtime/code-examples/*.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/realtime/code-examples/$FILE.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/realtime/code-examples/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/realtime/examples/index.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/realtime/examples/index.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/realtime/examples/index.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/realtime/examples/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/realtime/feed-entities/*.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/realtime/feed-entities/*.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/realtime/feed-entities/$FILE.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/realtime/feed-entities/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/realtime/feed-examples/*.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/realtime/feed-examples/*.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/realtime/feed-examples/$FILE.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/realtime/feed-examples/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## docs/resources/*.md
sed -i.bak 's,.*"input_path".*,    "input_path": "docs/resources/*.md"\,,' simpleen.config.json
sed -i.bak 's,.*"output_path".*,    "output_path": "docs/resources/$FILE.$locale.md"\,,' simpleen.config.json
yarn run simpleen translate

for file in docs/resources/*.pt-br.md
do
  mv "$file" "${file%.pt-br.md}.pt_BR.md"
done

## remove all temporary .bak files
find . -name "*.bak" -type f -delete
