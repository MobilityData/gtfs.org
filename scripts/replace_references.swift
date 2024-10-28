import Foundation

// Actor to handle thread-safe counting of replacements
actor ReplacementCounter {
    private var totalReplacements : Int = 0
    private var fileCount : Int = 0
    
    func incrementReplacements(by count : Int) {
        totalReplacements += count
    }
    
    func incrementFileCount() {
        fileCount += 1
    }
    
    func getStats() -> (files : Int, replacements : Int) {
        return (fileCount, totalReplacements)
    }
}

// Function to recursively find all .md files in a directory
func findMarkdownFiles(in directory : String) throws -> [String] {
    let fileManager : FileManager = FileManager.default
    var markdownFiles: [String] = []
    
    guard let enumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(
        at: URL(fileURLWithPath: directory),
        includingPropertiesForKeys: [.isRegularFileKey],
        options: [.skipsHiddenFiles]
    ) else { return [] }
    
    for case let fileURL as URL in enumerator {
        guard fileURL.pathExtension == "md" else { continue }
        markdownFiles.append(fileURL.path)
    }
    
    return markdownFiles
}

// Process a single file
func processFile(_ filePath: String, with replacements: [String: String], counter: ReplacementCounter) async throws {
    let fileURL : URL = URL(fileURLWithPath: filePath)
    
    do {
        let content : String = try String(contentsOf: fileURL, encoding: .utf8)
        var modifiedContent : String = content
        var fileReplacements : Int = 0
        
        // Perform replacements
        for (oldText, newText) in replacements {
            let previousContent : String = modifiedContent
            modifiedContent = modifiedContent.replacingOccurrences(of: oldText, with: newText)
            
            // Count replacements in this file
            let replacementsCount : Int = previousContent.components(separatedBy: oldText).count - 1
            fileReplacements += replacementsCount
        }
        
        // Only write to file if changes were made
        if fileReplacements > 0 {
            try modifiedContent.write(to: fileURL, atomically: true, encoding: .utf8)
            print("Modified \(filePath) - Made \(fileReplacements) replacements")
            await counter.incrementReplacements(by: fileReplacements)
        }
        await counter.incrementFileCount()
        
    } catch {
        print("Error processing \(filePath): \(error.localizedDescription)")
        throw error
    }
}

// Dictionary of replacements
let replacements: [String : String] = [
    "TimeVariableFares_OffPeak.png"                     : "TimeVariableFares-OffPeak.png",
    "TimeVariableFares_Peak.png"                        : "TimeVariableFares-Peak.png",
    "create_001.png"                                    : "create-001.png",
    "create_002.png"                                    : "create-002.png",
    "create_003.png"                                    : "create-003.png",
    "deviated _drop-off _route.zip"                     : "deviated-drop-off-route.zip",
    "deviated_route_zones.png"                          : "deviated-route-zones.png",
    "first_stop_reference.png"                          : "first-stop-reference.png",
    "homepage-theme-image_720x720@1x.png"               : "homepage-theme-image-720x720@1x.png",
    "on-demand_services_between_multiple_zones(r).zip"  : "on-demand-services-between-multiple-zones(r).zip",
    "on-demand_services_between_multiple_zones.zip"     : "on-demand-services-between-multiple-zones.zip",
    "on-demand_services_within_a_single_zone.zip"       : "on-demand-services-within-a-single-zone.zip",
    "propagated_delay.png"                              : "propagated-delay.png",
    "trip_modification.png"                             : "trip-modification.png",
    "validator_demo_large.mp4"                          : "validator-demo-large.mp4",
    "what_is_gtfs_001.png"                              : "what-is-gtfs-001.png",
    "what_is_gtfs_002.png"                              : "what-is-gtfs-002.png",
    "get_involved.md"                                   : "get-involved.md",
    "gtfs_realtime_amendment_process.md"                : "gtfs-realtime-amendment-process.md",
    "gtfs_schedule_amendment_process.md"                : "gtfs-schedule-amendment-process.md",
    "change_history/recent_additions.md"                : "change-history/recent-additions.md",
    "change_history/revision_history.md"                : "change-history/revision-history.md",
    "realtime_best_practices.md"                        : "realtime-best-practices.md",
    "schedule_best_practices.md"                        : "schedule-best-practices.md",
    "example_feed.md"                                   : "example-feed.md",
    "getting_started/features/base_add-ons.md"          : "getting-started/features/base-add-ons.md",
    "getting_started/features/flexible_services.md"     : "getting-started/features/flexible-services.md",
    "getting_started/what_is_GTFS.md"                   : "getting-started/what-is-GTFS.md",
    "getting_started/why_use_GTFS.md"                   : "getting-started/why-use-GTFS.md",
    "/change_history"                                   : "/change-history",
    "/feed_entities"                                    : "/feed-entities",
    "/getting_started"                                  : "/getting-started"
]

// Get the directory path from command line argument or use current directory
let directory : String = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : FileManager.default.currentDirectoryPath

// Create counter actor
let counter : ReplacementCounter = ReplacementCounter()

// Run async code using Task
Task {
    do {
        // Find all markdown files
        let markdownFiles : [String] = try findMarkdownFiles(in: directory)
        
        // Process files concurrently
        try await withThrowingTaskGroup(of: Void.self) { group in
            for filePath : String in markdownFiles {
                group.addTask {
                    try await processFile(filePath, with: replacements, counter: counter)
                }
            }
            try await group.waitForAll()
        }
        
        // Get final statistics
        let (fileCount, totalReplacements) = await counter.getStats()
        print("\nCompleted processing \(fileCount) markdown files")
        print("Total replacements made: \(totalReplacements)")
        
    } catch {
        print("Error: \(error.localizedDescription)")
        exit(1)
    }
}

// Keep the script running until async work is done
RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.1))