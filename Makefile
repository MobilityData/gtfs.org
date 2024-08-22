PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

clean:
	rm -rf site/

serve:
	make clean
	./scripts/i18n-landing-assets-setup.sh
	mkdocs serve --watch overrides

build:
	scripts/i18n-landing-assets-setup.sh
	mkdocs build

deploy:
	mkdocs gh-deploy
