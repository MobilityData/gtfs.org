BUILD_DIR = generated # Variable for the output directory
LANGUAGES = en fr es ja ru ko id de pt zh zh-TW
SEPARATOR = "---------------------------------------------------------"

clean:
	rm -Rf $(BUILD_DIR)

setup:
	pip3 install --force-reinstall -r requirements.txt && \
	pip3 install --upgrade --force-reinstall mkdocs-material

serve:
	make clean
	./scripts/i18n-landing-assets-setup.sh
	@echo "Serving MkDocs site..."
	@trap 'echo "Stopping MkDocs server..."; pkill -f "mkdocs serve"' SIGINT SIGTERM; \
	mkdocs serve --dev-addr 127.0.0.1:8000 --config-file config/en/mkdocs.yml & \
	mkdocs serve --dev-addr 127.0.0.1:8001 --config-file config/fr/mkdocs.yml & \
	mkdocs serve --dev-addr 127.0.0.1:8002 --config-file config/es/mkdocs.yml & \
	mkdocs serve --dev-addr 127.0.0.1:8003 --config-file config/ja/mkdocs.yml & \
	wait

build:
	@echo ""
	@echo "Preparing to build..."
	make clean
	./scripts/i18n-landing-assets-setup.sh
	mkdir -p $(BUILD_DIR)
	@echo ""
	@echo "$(SEPARATOR)"
	@echo "Building MkDocs sites..."
	$(foreach lang, $(LANGUAGES), \
	    echo ""; \
	    echo "$(SEPARATOR)"; \
		echo "Building $(lang)..."; \
		mkdocs build -f config/$(lang)/mkdocs.yml --clean; \
	)