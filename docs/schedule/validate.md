<a class="pencil-link" href="" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# GTFS Schedule Validator

This free and open-source canonical GTFS Schedule validator is maintained by [MobilityData](https://mobilitydata.org) with the help of the GTFS community. Use it to evaluate your dataset against the official [GTFS Reference](reference.md) and [Best Practices](best-practices.md). It provides an easy-to-use validation report in an HTML format that can be opened in the browser and shared with other parties.

<!-- <img class="center" src="../../assets/validator_animation.gif" width="150"> -->
<br>

<div class="usage-buttons">
    <a class="button" href="https://share.mobilitydata.org/validator-installer-mac">Download for Mac &nbsp;&nbsp;<img class="icon" src="../../assets/apple.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-windows">Download for Windows &nbsp;&nbsp;<img class="icon" src="../../assets/windows.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu">Download for Ubuntu &nbsp;&nbsp;<img class="icon" src="../../assets/ubuntu.svg" width="20"/></a>
</div>

**VERSION v4.0.0** / [Read the release notes](https://github.com/MobilityData/gtfs-validator/releases/latest)

<hr>

## Usage

<div class="usage">
    <div class="usage-list">
        <ol>
            <li>Download the latest version of the project based on our operating system.</li>
            <li>Once installed, run the application and a window will appear.</li>
            <li>Load your GTFS dataset: you can specify a URL, ZIP file, or directory containing the individual .txt files of a feed.</li>
            <li>Choose an output directory: This is the directory where the validation reports will be written.</li>
            <li>When the validation is finished, the results will automatically open in your browser. If you can’t see them, just open the report.html file that got created in the output path.</li>
            <li>You will see if the validator found issues with the data, and links to our documentation for how to fix them. The validation report will be saved as an HTML file, so it can easily be saved and shared with others.</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls>
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </video>
    </div>
</div>

## Use This Validator as Part of Your Data Pipeline

To see more instructions on how to use this tool in your data pipeline, please visit the [GitHub repository](https://github.com/MobilityData/gtfs-validator).

## Contributing

This project is a community effort, and anyone interested in this project can join the community, participate in decision-making and help advance it in different ways. There are many different ways to contribute: sharing your idea for a new feature, reporting a problem, improving the documentation, teaching others how to use it, etc.


Interested in contributing to this project? Please visit the [GitHub repository](https://github.com/MobilityData/gtfs-validator) and read our [contribution guidelines](https://github.com/MobilityData/gtfs-validator/blob/master/docs/CONTRIBUTING.md).
