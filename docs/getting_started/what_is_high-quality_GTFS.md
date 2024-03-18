# Checking the quality of a GTFS dataset

## GTFS Schedule Validator

This free and open-source canonical GTFS Schedule validator is maintained by [MobilityData](https://mobilitydata.org) with the help of the GTFS community. Use it to evaluate your dataset against the official [GTFS Reference](reference.md) and [Best Practices](best-practices.md). It provides an easy-to-use validation report in an HTML format that can be opened in the browser and shared with other parties.

<!-- <img class="center" src="../../assets/validator_animation.gif" width="150"> -->
<br>

**Current version: 4.2** [(see the release notes)](https://github.com/MobilityData/gtfs-validator/releases/latest)

<hr>

### Usage

<div class="usage">
    <div class="usage-list">
        <ol>
            <li>Go to <a href="https://gtfs-validator.mobilitydata.org/">gtfs-validator.mobilitydata.org</a>. </li>
            <li>Load your GTFS dataset: you can select or drag & drop a ZIP file, or copy/paste a URL.</li>
            <li>When the validation is finished, an option to open the report will be provided.</li>
            <li>You will see if the validator found issues with the data, and links to our documentation for how to fix them. The URL of the validation report will work for 30 days and can be shared with others.</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls>
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </video>
    </div>
</div>

### Use This Validator as Part of Your Data Pipeline

To see more instructions on how to use this tool in your data pipeline, please visit the [GitHub repository](https://github.com/MobilityData/gtfs-validator).

### Community

This project is a community effort, and anyone interested in this project can join the community, participate in decision-making and help advance it in different ways. There are many different ways to contribute: sharing your idea for a new feature, reporting a problem, improving the documentation, teaching others how to use it, etc.

👀  [See who is using this validator](https://github.com/MobilityData/gtfs-validator/wiki/Organizations-using-this-GTFS-Validator).  
💬  Help us improve this tool by [sharing your feedback](https://forms.gle/bWrXGDCUqrGfRYCs8).  
🤝  Interested in contributing to this project? Please visit the [GitHub repository](https://github.com/MobilityData/gtfs-validator) and read our [contribution guidelines](https://github.com/MobilityData/gtfs-validator/blob/master/docs/CONTRIBUTING.md).



## What is High Quality GTFS?

High quality GTFS is complete, accurate, and up-to-date. This means that it represents how services are currently operating and provides as much information as possible.
For information on creating high quality data, see the [California Transit Data Guidelines](https://dot.ca.gov/cal-itp/california-transit-data-guidelines), the [GTFS Schedule Best Practices](https://gtfs.org/schedule/best-practices/) and the [GTFS Realtime Best Practices](https://gtfs.org/realtime/best-practices/).
For evaluating the quality of a dataset, see [Validate](https://gtfs.org/schedule/validate/) page.

### Complete Data

Quality GTFS includes important service details such as holiday and summer schedule changes, accurate stop locations, and names for routes and headsigns that match other rider-facing materials. Even if an agency works with a vendor to produce GTFS, it’s ultimately up to the agency to ensure that the information presented in print, on board, and online is consistent.

### Accurate Data

Accurate data is essential for providing transit riders with a reliable and user-friendly transportation experience. Errors in the data can block a portion or the totality of a dataset from being used. 

### Up to Date

Having out of date data is almost worse than no feed at all. It's not enough to simply publish information—it has to match what the rider sees and experiences. Some of the largest transit agencies update their GTFS weekly, or even daily, but most agencies will need to update their GTFS every few months, or a few times a year when service changes. This includes things like new routes or stops, timetable changes, or updates to fare structure.
 
Many agencies hire a vendor to create and manage their GTFS for them. Some vendors may be proactive in asking about service changes, but it’s important that agencies communicate with vendors about upcoming service changes. It’s possible to publish GTFS with service changes in advance, making sure the transition goes smoothly for everyone—agencies, vendors, trip planners, and riders!


