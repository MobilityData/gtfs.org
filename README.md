# GTFS.org LLM-based Japanese Translation

This project is a fork of [MobilityData/gtfs.org](https://github.com/MobilityData/gtfs.org),  
maintained by the [Association for Open Data of Public Transportation (ODPT)](https://www.odpt.org/).
It provides a Japanese translation of the official GTFS.org website using LLM-based translation workflows.

## Workflow overview

This repository maintains two main branches:

- **main**: kept in sync with the upstream [MobilityData/gtfs.org](https://github.com/MobilityData/gtfs.org) `main` branch.  
  Automated workflow [`sync-and-merge-main-into-llm-translation.yaml`](.github/workflows/sync-and-merge-main-into-llm-translation.yaml) ensures synchronization.

- **llm-translation**: default branch for publication and modifications.  
  LLM-based translations are generated here via the [`llm-translate.yaml`](.github/workflows/llm-translate.yaml) workflow.  
  Build and deployment are handled with [`Makefile.llm`](Makefile.llm) and [`firebase_deploy.yaml`](.github/workflows/firebase_deploy.yaml).

### Translation

- English sources under `docs/en/` are translated to Japanese (`docs/ja-llm/`) by the GitHub Actions workflow.  
- Translation uses the OpenAI API, with incremental updates tracked by `last_translated_source_commit.txt`.  
- Changes in upstream English content trigger re-translation.

### Deployment

- Japanese LLM-translated site is built using [MkDocs](https://www.mkdocs.org/) with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).  
- The site is deployed automatically to Firebase Hosting at [https://gtfs-translation.odpt.org](https://gtfs-translation.odpt.org).

## License

Except as otherwise noted, the content of this site is licensed under the [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/), and code samples are licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).

---

## Original README (excerpt from MobilityData/gtfs.org)

> # GTFS.org
> 
> Source code for [GTFS.org](https://gtfs.org/).
> 
> This site was built using [MkDocs](https://www.mkdocs.org/), a static site generator, and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), a technical documentation theme for MkDocs.
> 
> ## How can I contribute to gtfs.org?
> 
> **Submit an issue or a content addition idea**
> 
> The more ideas, the merrier! If you have an idea for how to improve GTFS.org's content or user experience design, open an [issue](https://github.com/MobilityData/gtfs.org/issues/new) on the GTFS.org repository.
> 
> **Suggest a change with a Pull Request**
> 
> To propose edits to the content, navigate to the page you want to change on [GTFS.org](https://gtfs.org/) and click on the "Edit this page" icon on the top-right of the page. The "Edit this page" icon will direct you to an editable page on the appropriate Github repository. You can then submit your edits as a pull request. 📝
> 
> **Contributing translations**
> 
> GTFS.org uses [Simpleen](https://simpleen.io/), an automated machine learning translation tool, to ensure translations are kept up to date with repository changes. Since our priority is to keep translations up-to-date, any one-time translation contributions will be overwritten by Simpleen in the future. 
> 
> We do accept glossary changes. Simpleen uses a glossary for key terms that are commonly used across GTFS.org, like trip or station. If you want to suggest a translation for a key term that should be applied across the entire site, you can [create an issue on the GTFS.org repository](https://github.com/MobilityData/gtfs.org/issues/new/choose).
> 
> ## Building or Serving the site locally
> 
> > [!WARNING]
> > A private token from MKDocs Material Insiders is required to build this site.
> 
> 1. In Terminal, change the directory to one where you wish to build the site.
> 1. Ensure you have an up-to-date version of pip: 
>    - Linux: `pip install pip` or `pip install --upgrade pip`
>    - macOS: `pip3 install pip` or `pip3 install --upgrade pip`
> 1. Clone this repository:
>    - `git clone https://github.com/MobilityData/gtfs.org`
> 1. Change the directory to the cloned repository, and create & enable a Python virtual > environment:
>    - `python3 -m venv venv`
>    - `source venv/bin/activate`
> 1. Have [`requirements.txt`](requirements.txt) installed:
>    - Linux: `pip install --force-reinstall -r requirements.txt`
>    - macOS: `pip3 install --force-reinstall -r requirements.txt`
> 1. Have [Material for MkDocs Insiders](https://squidfunk.github.io/mkdocs-material/insiders/`) installed. Substitute `${GH_TOKEN}` with a valid access token:
>    - Linux: `pip install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git`
>    - macOS: `pip3 install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git`
> 1. To run the site locally (command defined in `MakeFile`):
>    - `make serve`
>    - Then each language will have it's own address:
>      - English: `http://127.0.0.1:8000/`
>      - French: `http://127.0.0.1:8001/`
>      - Spanish: `http://127.0.0.1:8002/`
>      - Japanese: `http://127.0.0.1:8003/`
> 1. To build the site locally only (command defined in `MakeFile`):
>    - `make build`
> 1. Deactivate the Python virtual environment when done:
>    - `deactivate`
>
> ## License
> 
> Except as otherwise noted, the content of this site is licensed under the [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/), and code samples are licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).
