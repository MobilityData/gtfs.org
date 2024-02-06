# Making a Transit Feed Publicly Available

Datasets should be published at a public, permanent URL, including the zip file name. (e.g., www.agency.org/gtfs/gtfs.zip). Ideally, the URL should be directly downloadable without requiring login to access the file, to facilitate download by consuming software applications. While it is recommended (and the most common practice) to make a GTFS dataset openly downloadable, if a data provider does need to control access to GTFS for licensing or other reasons, it is recommended to control access to the GTFS dataset using API keys, which will facilitate automatic downloads.

The web-server hosting GTFS data should be configured to correctly report the file modification date (see HTTP/1.1 - Request for Comments 2616, under Section 14.29).

See “[Best Practices: Dataset Publishing](best-practices/#dataset-publishing-general-practices)” for further recommendations.