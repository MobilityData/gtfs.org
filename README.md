# GTFS.org

Source code for [GTFS.org](https://gtfs.org/).

This site was built using [MkDocs](https://www.mkdocs.org/), a static site generator, and `mkdocs-materialx`, a technical documentation theme for MkDocs (a fork of [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)).

## How can I contribute to gtfs.org?

**Submit an issue or a content addition idea**

The more ideas, the merrier! If you have an idea for how to improve GTFS.org's content or user experience design, open an [issue](https://github.com/MobilityData/gtfs.org/issues/new) on the GTFS.org repository.

**Suggest a change with a Pull Request**

To propose edits to the content, navigate to the page you want to change on [GTFS.org](https://gtfs.org/) and click on the "Edit this page" icon on the top-right of the page. The "Edit this page" icon will direct you to an editable page on the appropriate Github repository. You can then submit your edits as a pull request. 📝

**Contributing translations**

Translations live under `docs/<lang>/` for each supported language. To add or improve a translation, fork the repository, edit the relevant Markdown files under that language's `docs/<lang>/` directory, and submit your changes as a pull request.

## Building or Serving the site locally

1. In Terminal, change the directory to one where you wish to build the site.
1. Ensure you have an up-to-date version of pip: 
   - Linux: `pip install pip` or `pip install --upgrade pip`
   - macOS: `pip3 install pip` or `pip3 install --upgrade pip`
1. Clone this repository:
   - `git clone https://github.com/MobilityData/gtfs.org`
1. Change the directory to the cloned repository, and create & enable a Python virtual environment:
   - `python3 -m venv venv`
   - `source venv/bin/activate`
1. Install dependencies, including the `mkdocs-materialx` theme (command defined in `Makefile`):
   - `make setup`
1. To run the site locally (command defined in `MakeFile`):
   - `make serve`
   - Then each language will have it's own address:
     - English: `http://127.0.0.1:8000/`
     - French: `http://127.0.0.1:8001/`
     - Spanish: `http://127.0.0.1:8002/`
     - Japanese: `http://127.0.0.1:8003/`
1. To build the site locally only (command defined in `MakeFile`):
   - `make build`
1. Deactivate the Python virtual environment when done:
   - `deactivate`

## License

Except as otherwise noted, the content of this site is licensed under the [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/), and code samples are licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).
