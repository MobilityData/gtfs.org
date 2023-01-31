# GTFS.org

Source code for [GTFS.org](https://gtfs.org/).

This site was built using [MkDocs](https://www.mkdocs.org/), a static site generator, and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), a technical documentation theme for MkDocs.

## How can I contribute to gtfs.org?

**Submit an issue or a content addition idea**

The more ideas, the merrier! If you have an idea for how to improve GTFS.org's content or user experience design, open an [issue](https://github.com/MobilityData/gtfs.org/issues/new) on the GTFS.org repository.

**Suggest a change with a Pull Request**

To propose edits to the content, navigate to the page you want to change on [GTFS.org](https://gtfs.org/) and click on the "Edit this page" icon on the top-right of the page. The "Edit this page" icon will direct you to an editable page on the appropriate Github repository. You can then submit your edits as a pull request. 📝

**Contributing translations**

GTFS.org uses [Simpleen](https://simpleen.io/), an automated machine learning translation tool, to ensure translations are kept up to date with repository changes. Since our priority is to keep translations up-to-date, any one-time translation contributions will be overwritten by Simpleen in the future. 

We do accept glossary changes. Simpleen uses a glossary for key terms that are commonly used across GTFS.org, like trip or station. If you want to suggest a translation for a key term that should be applied across the entire site, you can [create an issue on the GTFS.org repository](https://github.com/MobilityData/gtfs.org/issues/new/choose).

## Building the site locally

1. In Terminal, change the directory to one where you wish to build the site.
1. Clone this repository:
   - `git clone https://github.com/MobilityData/gtfs.org`
1. Ensure you have an up-to-date version of pip:
   - `pip install pip`
   - N.B.: on macOS, use `pip3 install pip` when using Python 3.
1. Change the directory to the cloned repository, and have [`requirements.txt`](requirements.txt) installed:
   - `pip install -r requirements.txt`
   - N.B.: on macOS, use `pip3 install -r requirements.txt` when using Python 3.
1. Have [Material for MkDocs Insiders](https://squidfunk.github.io/mkdocs-material/insiders/`) installed. Substitute `${GH_TOKEN}` with MobilityData's access token:
   - `pip install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material.git`
1. Assuming you are still in the cloned repository, run this command to update the content for the specification references and best practices:
   - `bash scripts/fetchdata.sh`
1. To run the site locally: `mkdocs serve`
1. To build the site locally only: `mkdocs build --clean`
1. To deploy the site to GitHub Pages: `mkdocs gh-deploy`

## License

Except as otherwise noted, the content of this site is licensed under the [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/), and code samples are licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).
