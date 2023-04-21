<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# gtfs-realtime-bindings [![Join the MobilityData chat](https://img.shields.io/badge/chat-on%20slack-red)](https://share.mobilitydata.org/slack)

Language bindings generated from the
[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) protocol
buffer spec for popular languages.

## Introduction

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) is a data
format for communicating real-time information about public transit systems.
GTFS Realtime data is encoded and decoded using [Protocol
Buffers](https://developers.google.com/protocol-buffers/), a compact binary
representation designed for fast and efficient processing.  The data schema
itself is defined in
[gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto).

To work with GTFS Realtime data, a developer would typically use the
`gtfs-realtime.proto` schema to generate classes in the programming language of
their choice.  These classes can then be used for constructing GTFS-realtime
data model objects and serializing them as binary data or, in the reverse
direction, parsing binary data into data model objects.

Because generating GTFS Realtime data model classes from the
`gtfs-realtime.proto` schema is such a common task, but also one that sometimes
causes confusion for first-time developers, this project aims to provide
pre-generated GTFS Realtime language bindings for a number of the most popular
programming languages.  Where possible, these language bindings will be
published as packages to facilitate their use in other projects.

## Supported Languages

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ *(Deprecated as of early 2019)*
* ~~[PHP](php.md)~~ *(Deprecated as of early 2019)*

## Other Languages

We don't provide generated code for C++, use the official protoc compiler for that (from [here](https://developers.google.com/protocol-buffers/docs/downloads) or [here](https://github.com/google/protobuf))

Are we missing your favorite language? Consider contributing:

1. Read [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md).
2. Open a pull request with your language of choice. Please include update instructions (ideally, scripts). Also, provide packaging suitable for the language ecosystem.

## Project History

This project was originally created by Google - MobilityData started to maintain the project in early 2019. 

Older versions of the bindings libraries are still published under Google's name.  See the documentation for each language [here](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) to find the last version published by Google.
