# Evaluate your GTFS feed’s quality

A high-quality GTFS is complete, accurate, and up-to-date. This means that it represents how services are currently operating and provides as much information as possible. 

## Complete data

Quality GTFS includes important service details such as holiday and summer schedule changes, accurate stop locations, and names for routes and headsigns that match other rider-facing materials. Even if an agency works with a vendor to produce GTFS, it’s ultimately up to the agency to ensure that the information presented in print, on board, and online is consistent.

## Accurate data

Accurate data is essential for providing transit riders with a reliable and user-friendly transportation experience. Errors in the data can block a portion or the totality of a dataset from being used.

## Up-to-date data

Out-of-date data can be more problematic than having no feed available. It's not enough to simply publish information—it has to match what the rider sees and experiences. Some of the largest transit agencies update their GTFS weekly, or even daily, but most agencies will need to update their GTFS every few months, or a few times a year when service changes. This includes things like new routes or stops, timetable changes, or updates to fare structure.

Many agencies hire a vendor to create and manage their GTFS for them. Some vendors may be proactive in asking about service changes, but it’s important that agencies communicate with vendors about upcoming service changes. It’s possible to publish GTFS with service changes in advance, making sure the transition goes smoothly for everyone—agencies, vendors, trip planners, and riders!

## Using official validators 

Official GTFS Validators assess the quality of a dataset against the official specification, ensuring a common understanding within the industry of what constitutes a high-quality dataset. 

The free and open-source [Canonical GTFS Schedule validator](https://gtfs-validator.mobilitydata.org/)[^1] maintained by [MobilityData](https://mobilitydata.org/) ensures your GTFS data is compliant with the official [GTFS Schedule Reference](../../documentation/schedule/reference/) and [Best Practices](../../documentation/schedule/schedule_best_practices). It provides an easy-to-use report that can be shared with other parties and comprehensive documentation.

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

Similarly, using the free and open-source canonical [GTFS Realtime Validator](https://github.com/MobilityData/gtfs-realtime-validator) ensures your GTFS data is compliant with the official [GTFS Realtime Reference](../../documentation/realtime/reference/) and [Best Practices](../../documentation/realtime/realtime_best_practices).

For information on creating high quality data, see the [California Transit Data Guidelines](https://dot.ca.gov/cal-itp/california-transit-data-guidelines), the [GTFS Schedule Best Practices](../../documentation/schedule/schedule_best_practices) and the [GTFS Realtime Best Practices](../../documentation/realtime/realtime_best_practices).

[^1]: To see more instructions on how to use this tool in your data pipeline and contribute to this project, please visit the [GitHub repository](https://github.com/MobilityData/gtfs-validator).
