BUILD_DIR = generated # Variable for the output directory
LANGUAGES = en fr es ja ru ko id de pt zh zh-TW

clean:
	rm -rf $(BUILD_DIR)/

serve:
	make build
	@echo "Serving MkDocs site..."
	@trap 'echo "Stopping MkDocs server..."; pkill -f "mkdocs serve"' SIGINT SIGTERM; \
	mkdocs serve -d $(BUILD_DIR) --dev-addr 127.0.0.1:8000 & \
	wait

build:
	@echo "Preparing to build..."
	make clean
	./scripts/i18n-landing-assets-setup.sh
	mkdir -p $(BUILD_DIR)
	@echo "Building MkDocs sites..."
	$(foreach lang, $(LANGUAGES), \
		mkdocs build -f config/$(lang)/mkdocs.yml --clean; \
	)