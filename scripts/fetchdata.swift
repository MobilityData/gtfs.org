import Foundation

// MARK: - ENUMS & STRUCTS

struct Replacement {
    let findWhat: String
    let replaceWith: String
}

enum LocalError: Error {
    case invalidInput
    case fileNotFound
    case fileNotFoundAtURL
    case URLinvalid
}

struct Insert {
    let value: Int
    static let beforeFirst : Insert = Insert(value: 1)
    static let beforeLast : Insert = Insert(value: -1)
}

// MARK: - MAIN FUNCTION

do {

    // Paths

    let pathScheduleReference                    : String = "docs/schedule/reference.md"
    let pathScheduleBestPractice                 : String = "docs/schedule/best-practices.md"
    let pathScheduleExample                      : String = "docs/schedule/example-feed.md"
    let pathRealtimeIndex                        : String = "docs/realtime/index.md"
    let pathRealtimeReference                    : String = "docs/realtime/reference.md"
    let pathRealtimeProto                        : String = "docs/realtime/proto.md"
    let pathRealtimeBestPractice                 : String = "docs/realtime/best-practices.md"
    let pathRealtimeFeedEntities                 : String = "docs/realtime/feed-entities/index.md"
    let pathRealtimeFeedEntitiesTripUpdates      : String = "docs/realtime/feed-entities/trip-updates.md"
    let pathRealtimeFeedExamplesTripUpdates      : String = "docs/realtime/feed-examples/trip-updates.md"
    let pathRealtimeFeedEntitiesServiceAlerts    : String = "docs/realtime/feed-entities/service-alerts.md"
    let pathRealtimeFeedExamplesServiceAlerts    : String = "docs/realtime/feed-examples/service-alerts.md"
    let pathRealtimeFeedEntitiesVehiclePositions : String = "docs/realtime/feed-entities/vehicle-positions.md"
    let pathRealtimeLanguageBindings             : String = "docs/realtime/language-bindings/index.md"

    // ---------------------------------------------------------------------------------

    // GTFS Schedule reference (schedule/reference)

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/reference.md"], 
                       toFilePath: pathScheduleReference,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this:"# GTFS Schedule Reference\n\n", atLine: Insert.beforeFirst, inFileAtPath: pathScheduleReference)
    var dictOfReplacements: [Replacement] = [
        Replacement(findWhat: "../../CHANGES.md", replaceWith: "../revision-history"),
        Replacement(findWhat: "examples/2-leg.svg", replaceWith: "../assets/2-leg.svg"),
        Replacement(findWhat: "examples/3-leg.svg", replaceWith: "../assets/3-leg.svg")
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathScheduleReference)

    // ---------------------------------------------------------------------------------

    // GTFS Schedule best practices (schedule/best-practices)

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/best-practices.md"], 
                       toFilePath: pathScheduleBestPractice,
              firstDeleteExisting: true,
                 appendToExisting: false)
    dictOfReplacements = [
        Replacement(findWhat: "#dataset-publishing--general-practices", replaceWith: "#dataset-publishing-general-practices"),
        Replacement(findWhat: "https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md", replaceWith: "../reference")
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathScheduleBestPractice)

    // ---------------------------------------------------------------------------------

    // GTFS Schedule examples + GTFS Schedule example feed (schedule/example-feed)

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/examples/README.md"], 
                       toFilePath: pathScheduleExample,
              firstDeleteExisting: true,
                 appendToExisting: false)
    dictOfReplacements = [
        Replacement(findWhat: "sample-feed-1.zip", replaceWith: "https://github.com/google/transit/blob/master/gtfs/spec/en/examples/sample-feed-1.zip?raw=true"),
        Replacement(findWhat: "(sample-feed-1)", replaceWith: "(https://github.com/google/transit/tree/master/gtfs/spec/en/examples/sample-feed-1)")
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathScheduleExample)

    // ---------------------------------------------------------------------------------

    // GTFS REALTIME + GTFS Realtime overview (realtime/)

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/README.md"], 
                       toFilePath: pathRealtimeIndex,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# GTFS Realtime Overview\n\n<div class=\"landing-page\">\n<a class=\"button\" href=\"reference\">Reference</a><a class=\"button\" href=\"best-practices\">Best Practices</a><a class=\"button\" href=\"feed-examples\">Examples</a><a class=\"button\" href=\"changes\">Changes</a>\n</div>\n\n## Getting Started\n\nProviding users transit data updates in real time greatly enhances their experience of your transit services. Providing up-to-date information about current arrival and departure times allows users to smoothly plan their trips. As a result, in case of an unfortunate delay, a rider would be relieved to know that they can stay home a little bit longer.\n\n", 
            atLine: Insert.beforeFirst,
      inFileAtPath: pathRealtimeIndex)
    dictOfReplacements = [
        Replacement(findWhat: "https://developers.google.com/transit/gtfs/reference", replaceWith: "../schedule/reference"),
        Replacement(findWhat: "feed-entities.md", replaceWith: "feed-entities"),
        Replacement(findWhat: "examples/", replaceWith: "feed-examples"),
        Replacement(findWhat: "reference.md", replaceWith: "reference"),
        Replacement(findWhat: "Publish your feed", replaceWith: "[Publish your feed](best-practices/#feed-publishing-general-practices)"),
        Replacement(findWhat: "../../proto/gtfs-realtime.proto", replaceWith: "proto")
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathRealtimeIndex)

    // ---------------------------------------------------------------------------------
    
    // GTFS Realtime reference

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/reference.md"], 
                       toFilePath: pathRealtimeReference,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# GTFS Realtime Reference\n\n", atLine: Insert.beforeFirst, inFileAtPath: pathRealtimeReference) // replace header
    dictOfReplacements = [
        Replacement(findWhat: "# Elements", replaceWith: "## Elements"),
        Replacement(findWhat: "#### Fields", replaceWith: "**Fields**"),
        Replacement(findWhat: "#### Values", replaceWith: "**Values**"),
        Replacement(findWhat: "#### _Values_", replaceWith: "**Values**"),
        Replacement(findWhat: "trip-updates.md", replaceWith: "/realtime/trip-update"),
        Replacement(findWhat: "https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#tripstxt", replaceWith: "/schedule/reference/#tripstxt"),
        Replacement(findWhat: "/gtfs-realtime/spec/en/examples/migration-duplicated.md", replaceWith: "https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/examples/migration-duplicated.md")
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathRealtimeReference)

    // ---------------------------------------------------------------------------------

    // GTFS Realtime proto

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/proto/gtfs-realtime.proto"], 
                       toFilePath: pathRealtimeProto,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# GTFS Realtime Protobuf\nDownload the [gtfs-realtime.proto](gtfs-realtime.proto) file and use it to compile your GTFS-realtime feed. The contents of the file are shown inline below.\nFor more information about using protobufs, see the [Protocol Buffers Developer Guide](https://developers.google.com/protocol-buffers/docs/overview).\n\n```protobuf\n", atLine: Insert.beforeFirst, inFileAtPath: pathRealtimeProto)
    _ = insert(this: "\n```", atLine: Insert.beforeLast, inFileAtPath: pathRealtimeProto)

    // ---------------------------------------------------------------------------------

    // GTFS Realtime best practices

    let arraysOfURLs : [String] = [
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/introduction.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/FeedHeader.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/FeedEntity.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/TripUpdate.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/TripDescriptor.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/VehicleDescriptor.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/StopTimeUpdate.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/StopTimeEvent.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/VehiclePosition.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/Position.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/Alert.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/Frequency-based.md", 
        "https://raw.githubusercontent.com/MobilityData/GTFS_Realtime_Best-Practices/master/en/about.md"
    ]
    _ = try downloadMarkdown(from: arraysOfURLs, 
                   toFilePath: pathRealtimeBestPractice,
          firstDeleteExisting: true,
             appendToExisting: true)
    _ = insert(this: "# GTFS Realtime Best Practices\n\n", atLine: Insert.beforeFirst, inFileAtPath: pathRealtimeBestPractice)

    dictOfReplacements = [
        Replacement(findWhat: "#practice-recommendations-organized-by-case", replaceWith: "#practice-recommendations-organized-by-use-case"),
        Replacement(findWhat: "https://gtfs.org/reference/realtime/v2/", replaceWith: "../reference")
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathRealtimeBestPractice)

    // ---------------------------------------------------------------------------------

    // GTFS Realtime feed entities

    // Feed Entities

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/feed-entities.md"], 
                       toFilePath: pathRealtimeFeedEntities,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# Feed Entities\n\n", atLine: Insert.beforeFirst, inFileAtPath: pathRealtimeFeedEntities)

    // Trip Updates
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/trip-updates.md"], 
                       toFilePath: pathRealtimeFeedEntitiesTripUpdates,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# Trip Updates\n\n", atLine: Insert.beforeFirst, inFileAtPath: pathRealtimeFeedEntitiesTripUpdates)

    dictOfReplacements = [
        Replacement(findWhat: "https://developers.google.com/transit/gtfs/", replaceWith: "../../schedule/reference.md"),
        Replacement(findWhat: "https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#tripstxt", replaceWith: "../../schedule/reference.md#tripstxt"),
        Replacement(findWhat: "reference.md#message-stoptimeupdate", replaceWith: "../reference.md#message-stoptimeupdate"),
        Replacement(findWhat: "reference.md#message-stoptimeevent", replaceWith: "../reference.md#message-stoptimeevent"),
        Replacement(findWhat: "/gtfs-realtime/spec/en/reference.md/#enum-schedulerelationship", replaceWith: "../reference.md#enum-schedulerelationship")
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathRealtimeFeedEntitiesTripUpdates)

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/examples/trip-updates-full.asciipb"], 
                       toFilePath: pathRealtimeFeedExamplesTripUpdates,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# Trip Update\nThe following example is an ASCII representation of an full-dataset Trip Update feed.\n```python\n", 
             atLine: Insert.beforeFirst,
       inFileAtPath: pathRealtimeFeedExamplesTripUpdates)
    _ = insert(this: "\n```", 
             atLine: Insert.beforeLast,
       inFileAtPath: pathRealtimeFeedExamplesTripUpdates)

    // Service Alerts
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/service-alerts.md"], 
                       toFilePath: pathRealtimeFeedEntitiesServiceAlerts,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# Service Alerts\n\n", atLine: Insert.beforeFirst, inFileAtPath: pathRealtimeFeedEntitiesServiceAlerts)

    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/examples/alerts.asciipb"], 
                       toFilePath: pathRealtimeFeedExamplesServiceAlerts,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# Service alert\nThe following example is an ASCII representation of an Alert feed.\n```python\n", 
             atLine: Insert.beforeFirst,
       inFileAtPath: pathRealtimeFeedExamplesServiceAlerts)
    _ = insert(this: "\n```", 
             atLine: Insert.beforeLast,
       inFileAtPath: pathRealtimeFeedExamplesServiceAlerts)

    // Vehicle Positions
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/vehicle-positions.md"], 
                       toFilePath: pathRealtimeFeedEntitiesVehiclePositions,
              firstDeleteExisting: true,
                 appendToExisting: false)
    _ = insert(this: "# Vehicle Positions\n\n", atLine: Insert.beforeFirst, inFileAtPath: pathRealtimeFeedEntitiesVehiclePositions)
    dictOfReplacements = [
        Replacement(findWhat: "reference.md#message-tripdescriptor", replaceWith: "../reference.md#message-tripdescriptor"),
        Replacement(findWhat: "reference.md#message-vehicledescriptor", replaceWith: "../reference.md#message-vehicledescriptor"),
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathRealtimeFeedEntitiesVehiclePositions)

    // ---------------------------------------------------------------------------------

    // GTFS Realtime Language Bindings
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/README.md"], 
                       toFilePath: pathRealtimeLanguageBindings,
              firstDeleteExisting: true,
                 appendToExisting: false)
    dictOfReplacements = [
        Replacement(findWhat: "dotnet/README.md", replaceWith: "dotnet.md"),
        Replacement(findWhat: "java/README.md", replaceWith: "java.md"),
        Replacement(findWhat: "nodejs/README.md", replaceWith: "nodejs.md"),
        Replacement(findWhat: "python/README.md", replaceWith: "python.md"),
        Replacement(findWhat: "golang/README.md", replaceWith: "golang.md"),
        Replacement(findWhat: "ruby/README.md", replaceWith: "ruby.md"),
        Replacement(findWhat: "https://github.com/google/gtfs-realtime-bindings-php", replaceWith: "php.md"),
        Replacement(findWhat: "(CONTRIBUTING.md)", replaceWith: "(https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md)"),
    ]
    _ = findAndReplaceOccurences(in: dictOfReplacements, inFileAtPath: pathRealtimeLanguageBindings)
    
    // dotnet
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/dotnet/README.md"], 
                       toFilePath: "docs/realtime/language-bindings/dotnet.md",
              firstDeleteExisting: true,
                 appendToExisting: false)
    // java
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/java/README.md"], 
                       toFilePath: "docs/realtime/language-bindings/java.md",
              firstDeleteExisting: true,
                 appendToExisting: false)

    // nodejs
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/nodejs/README.md"], 
                       toFilePath: "docs/realtime/language-bindings/nodejs.md",
              firstDeleteExisting: true,
                 appendToExisting: false)

    // python
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/python/README.md"], 
                       toFilePath: "docs/realtime/language-bindings/python.md",
              firstDeleteExisting: true,
                 appendToExisting: false)

    // golang
    _ = try downloadMarkdown(from: ["https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/golang/README.md"], 
                       toFilePath: "docs/realtime/language-bindings/golang.md",
              firstDeleteExisting: true,
                 appendToExisting: false)

} catch LocalError.invalidInput {
    print("ERROR : Incorrect paramter")

} catch LocalError.URLinvalid {
    print("ERROR : Invalid URL")

} catch LocalError.fileNotFound {
    print("ERROR : Invalid URL")

} catch LocalError.fileNotFoundAtURL {
    print("ERROR : File not found at provided URL")

} catch {
    print("ERROR : An unexpected error occurred: \(error).")

}

// MARK: - FUNCTIONS

func downloadMarkdown(from mkdownURLs: [String], toFilePath theFilePath: String, firstDeleteExisting: Bool, appendToExisting: Bool) throws -> String {
    for currentUrl : String in mkdownURLs {
        if currentUrl.isEmpty { throw LocalError.URLinvalid }
        guard let currentUrlasURL : URL = URL(string: currentUrl) else { throw LocalError.URLinvalid }
        if !firstDeleteExisting {
            let fileContents : String? = try String(contentsOfFile: currentUrlasURL.absoluteString)
            return fileContents!
        }
    }
    return ""
}

func insert(this theString: String, atLine theLine: Insert, inFileAtPath theFilePath: String) -> Bool {
    do {
        guard let theFilePathURL : URL = URL(string:theFilePath) else { throw LocalError.URLinvalid }
        try theString.write(to: theFilePathURL, atomically: true, encoding: .utf8)
        
    } catch LocalError.URLinvalid {
        print("ERROR : Invalid URL (\(theFilePath))")

    } catch {
        print("ERROR : Error writing at \(theFilePath) : \(error.localizedDescription)")
    }
    return false
}

func findAndReplaceOccurences(in replacements: [Replacement], inFileAtPath theFilePath: String) -> Bool {
    for replacement : Replacement in replacements {
        print("Key: \(replacement.findWhat), Value: \(replacement.replaceWith)")
    }
    return false
}
