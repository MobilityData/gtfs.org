# GTFS.org

Source code for [gtfs.org](https://gtfs.org/). 

This site was built using [MkDocs](https://www.mkdocs.org/), a static site generator, and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), a technical documentation theme for MkDocs.

## Editing site

To propose a feature, content addition, or UI/UX improvement, open an [issue](https://github.com/MobilityData/gtfs.org/issues/new) or [pull request](https://github.com/MobilityData/gtfs.org/pulls) on this repository. 

To edit site content, click on the pencil icon on the top right corner of the webpage to find the source-of-truth document. 📝

## Building the site locally

1. Clone this repository: `git clone https://github.com/MobilityData/gtfs.org`
1. Ensure you have an up-to-date version of pip: `pip install pip`
1. Have [`requirements.txt`](requirements.txt) installed: `pip install ~/mobilitydata/gtfs.org/requirements.txt`
1. Have [Material for MkDocs Insiders](https://squidfunk.github.io/mkdocs-material/insiders/) installed. Substitute `${GH_TOKEN}` with MobilityData's personal access token: `pip install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git`
1. In the terminal, navigate to the repository directory (`~/mobilitydata/gtfs.org`) and run this command to update the content for the specification references and best practices: `bash scripts/fetchdata.sh`
1. To run the site locally: `mkdocs serve`
1. To deploy the site to GitHub Pages: `mkdocs gh-deploy`

## License

Except as otherwise noted, the content of this site is licensed under the [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/), and code samples are licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0).


