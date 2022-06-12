<a href="https://github.com/google/transit/edit/master/gtfs-realtime/CHANGES.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.71 7.04c.39-.39.39-1.04 0-1.41l-2.34-2.34c-.37-.39-1.02-.39-1.41 0l-1.84 1.83 3.75 3.75M3 17.25V21h3.75L17.81 9.93l-3.75-3.75L3 17.25Z"></path></svg>
  </a>
  
# Extensions
To allow producers to add custom information to a GTFS Realtime feed, we will take advantage of the [Extensions feature of Protocol Buffers](https://developers.google.com/protocol-buffers/docs/proto#extensions). Extensions allow us to define a namespace in a Protocol Buffer message where third-party developers can define additional fields without the need to modify the original proto definition.

When possible we should avoid extensions and add fields useful to many agencies to the main specification to avoid fragmentation and extra work for consumers to support various extensions to the spec.  Before requesting an extension id, producers should propose adding the field to the specification (see [Adding new fields to GTFS Realtime](../process))

The extension IDs within the range 9000-9999 are reserved for private use by GTFS-rt producers. These IDs should only be used to convey information internally to your organization. Extensions in this range **must not** be used in public feeds. 

To create a new extension, we will assign a producer the next available extension id, picked incrementally from a list of numbers starting at 1000 and going up and documented in the Extension Registry section found below.

These assigned extension ids corresponds to the tag ids available in the "extension" namespace for each GTFS Realtime message definition. Now that the developer has an assigned extension id, they will use that id when extending any and all GTFS Realtime messages. Even if the developer only plans to extend a single message, the assigned extension id will be reserved for ALL messages.

For a developer extending the spec, instead of adding a single field like a "string" or "int32" with their extension id, the preferred model is to define a new message like "MyTripDescriptorExtension", extend the underlying GTFS Realtime message with your new message, and then put all your new fields in there. This has the nice property that you can manage fields within your extension message however you want, without needing to reserve a new extension id from the master list.

```protobuf
message MyTripDescriptorExtension {
  optional string some_string = 1;
  optional bool some_bool = 2;
  ...
}
extend transit_realtime.TripDescriptor {
  optional MyTripDescriptorExtension my_trip_descriptor = YOUR_EXTENSION_ID;
}
```

When creating extensions, developers should follow the [Protocol Buffers Language Guide](https://developers.google.com/protocol-buffers/docs/proto). A common mistake is re-using an extension field number. In the [Assigning Field Numbers section](https://developers.google.com/protocol-buffers/docs/proto#assigning-field-numbers), the Language Guide says:

> Each field in the message definition has a unique number. These numbers are used to identify your fields in the message binary format, and should not be changed once your message type is in use.

For example, in the first example `some_string` was assigned field number `1`. When the developer no longer wishes to use `some_string`, or when `some_string` has been adopted in the official GTFS Realtime spec and there is no need for the extension, the developer cannot re-use field number `1` for a new field. Instead, the developer should deprecate the field and use a new number for the new field:
```protobuf
message MyTripDescriptorExtension {
  optional string some_string = 1 [deprecated=true];
  optional bool some_bool = 2;
  optional string some_new_string = 3;
  ...
}
```

## Extension Registry

|Extension ID|Developer|Contact|Details|
|------------|---------|-------|-------|
|1000|OneBusAway|[onebusaway-developers](https://groups.google.com/group/onebusaway-developers)|https://github.com/OneBusAway/onebusaway/wiki/GTFS-Realtime-Resources|
|1001|New York City MTA|[mtadeveloperresources](https://groups.google.com/group/mtadeveloperresources)|https://mta.info/developers/|
|1002|Google|[transit-realtime-partner-support@google.com](mailto:transit-realtime-partner-support@google.com)|Google Maps Live Transit Updates|
|1003|OVapi|gtfs-rt at ovapi.nl|https://gtfs.ovapi.nl|
|1004|Metra|[William Ashbaugh <w.l.ashbaugh@gmail.com>](mailto:w.l.ashbaugh@gmail.com)|
|1005|Metro-North Railroad|[John Larsen](mailto:mnrappdev@mnr.org)|
|1006|realCity|[David Varga](mailto:transit@realcity.io)|https://realcity.io|
|1007|Transport for NSW|[timetable@transport.nsw.gov.au](mailto:timetable@transport.nsw.gov.au)|[Group discussion](https://groups.google.com/forum/#!msg/gtfs-realtime/WYwIs4Hd_E0/PbkMnELUAwAJ)|
|1008|SEPTA - Southeastern Pennsylvania Transportation Authority|[Gregory Apessos](mailto:GApessos@septa.org)|https://github.com/septadev|
|1009|Swiftly|[mike@goswift.ly](mailto:mike@goswift.ly)|[Group Discussion](https://groups.google.com/forum/#!msg/gtfs-realtime/mmnZV6L-2ls/wVWdknhLBwAJ)|
|1010|IBI Group|[Ritesh Warade](mailto:transitrealtime@ibigroup.com)|[GitHub proposal for new timestamps in Service Alerts](https://github.com/google/transit/pull/134)|
|9000-9999|RESERVED - INTERNAL USE ONLY|[GTFS Community](https://groups.google.com/forum/#!forum/gtfs-realtime)|[Group discussion](https://github.com/google/transit/pull/178/)|
