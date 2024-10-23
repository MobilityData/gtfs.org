/// Updated for Swift 6 - Oct 2024

import Foundation
#if canImport(FoundationNetworking)
    import FoundationNetworking // Import Foundation for Linux
#endif

// MARK: - Enums & Structs

enum RESTmethod : String {
    case GET    // Retrieves data from a server.
    case POST   // Sends data to a server to create a new resource.
    case PUT    // Sends data to a server to update or replace an existing resource.
    case DELETE // Deletes the specified resource.
    case PATCH  // Applies partial modifications to a resource.
    case HEAD   // Retrieves metadata from a resource without transferring the entire content.
}

struct HTTPHeaderField : Encodable {
    static let authorization    : String = "Authorization"
    static let accept           : String = "Accept"
    static let contentType      : String = "Content-Type"
    static let xGoogUserProject : String = "x-goog-user-project"
}

struct HTTPValue : Encodable {
    static let bearer                     : String = "Bearer "
    static let applicationJson            : String = "application/json"
    static let applicationJsonCharsetUTF8 : String = "application/json; charset=utf-8"
    static let applicationVndGithubJson   : String = "application/vnd.github+json"
    static let textPlain                  : String = "text/plain"
}

// MARK: - Configuration

let githubToken    : String = ProcessInfo.processInfo.environment["GITHUB_TOKEN"]!
// Captures the token in the action step when formulated like this:
//    - name: Run Swift script
//      id: run-swift-script
//      run: swift /path/to/your/script.swift
//      env:
//        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

let numberOfDaysToLookBack : Int           = 30

let githubDateTimeFormat   : String        = "yyyy-MM-dd'T'HH:mm:ss'Z'"  // Github requires dates be formatted like this : YYYY-MM-DDTHH:MM:SSZ
let currentDate            : Date          = Date() ; let currentDateComponents : DateComponents = Calendar.current.dateComponents([.day, .year, .month], from: currentDate)
let sinceDate              : Date          = Calendar.current.date(byAdding: .day, value: -numberOfDaysToLookBack, to: Date())!
let iso8601Formatter       : DateFormatter = DateFormatter() ; iso8601Formatter.dateFormat = githubDateTimeFormat
let sinceDateIso8601       : String        = iso8601Formatter.string(from: sinceDate)

// MARK: - Constants

let isInDebugMode          : Bool   = false
let baseDestinationURL     : String = "gtfs.org"
let baseName               : String = "main"
let repoToUse              : String = "MobilityData/\(baseDestinationURL)"
let issueAssignees         : String = "[\"Sergiodero\"]" // needs to be a list. Ex: ["name1,name2"]
let issueLabels            : String = "[\"automated-content-update\"]" // needs to be a list. Ex: ["label1,label2"]
let issueTitle             : String = "Daily Report: Modified Files on remote repos (\(currentDateComponents.year ?? 0)-\(currentDateComponents.month ?? 0)-\(currentDateComponents.day ?? 0))"
let issueBody              : String = "The following files have been modified in the last \(numberOfDaysToLookBack) day(s):\n"

// MARK: - Dict of pages to monitor

struct PageToMonitor {
    var targetRepo       : String  // owner/repo
    var monitorPageAtURL : String  // the URL of the page to monitor for changes
    var correspondsToURL : String  // the URL on gtfs.org which corresponds to the monitored page
    var notes            : String  // any notes that will be displayed in the Github
}

let pagesToMonitor : [PageToMonitor] = [
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs/spec/en/reference.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/schedule/reference/",
                  notes            : "—"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs/best-practices/best-practices.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/schedule/schedule_best_practices/",
                  notes            : "—"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs/spec/en/revision-history.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/schedule/change_history/revision_history/",
                  notes            : "—"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/reference.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/reference/",
                  notes            : "Heading formatting in the google/transit repo is off, we might need to adjust this in that repo"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/best-practices/best-practices.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/realtime_best_practices/",
                  notes            : "—"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/feed-entities.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/feed_entities/overview/",
                  notes            : "—"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/trip-updates.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/feed_entities/trip-updates/",
                  notes            : "Text https://github.com/MobilityData/awesome-transit/blob/master/README.md google/transit is pasted starting on line 3, the only prefiled text is the page heading."),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/service-alerts.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/feed_entities/service-alerts/",
                  notes            : "Text https://github.com/MobilityData/awesome-transit/blob/master/README.md google/transit is pasted starting on line 3, the only prefiled text is the page heading."),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/vehicle-positions.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/feed_entities/vehicle-positions/",
                  notes            : "Text https://github.com/MobilityData/awesome-transit/blob/master/README.md google/transit is pasted starting on line 3, the only prefiled text is the page heading."),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/trip-modifications.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/feed_entities/trip-modifications/",
                  notes            : "—"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/proto/gtfs-realtime.proto",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/proto/",
                  notes            : "Text https://github.com/MobilityData/awesome-transit/blob/master/README.md the proto file is copied into \(baseDestinationURL) page and formatted as code starting on line 5. The file can also be downloaded directly so a copy of the file exist in docs/documentation/realtime"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/examples/alerts.asciipb",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/examples/service-alerts/",
                  notes            : "Text https://github.com/MobilityData/awesome-transit/blob/master/README.md the example file is copied into \(baseDestinationURL) page and formatted as code starting on line 6"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/examples/trip-updates-full.asciipb",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/examples/trip-updates/",
                  notes            : "Text https://github.com/MobilityData/awesome-transit/blob/master/README.md the example file is copied into \(baseDestinationURL) page and formatted as code starting on line 6"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/examples/migration-duplicated.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/examples/migration-duplicated/",
                  notes            : "—"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/spec/en/revision-history.md",
                  correspondsToURL : "https://\(baseDestinationURL)/documentation/realtime/change_history/revision_history/",
                  notes            : "—"),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs/CHANGES.md",
                  correspondsToURL : "https://\(baseDestinationURL)/community/governance/gtfs_schedule_amendment_process/",
                  notes            : "Text https://github.com/MobilityData/awesome-transit/blob/master/README.md google/transit is taken https://github.com/MobilityData/awesome-transit/blob/master/README.md line 3 onwards and pasted in \(baseDestinationURL) starting on line 9 "),
    PageToMonitor(targetRepo       : "google/transit",
                  monitorPageAtURL : "gtfs-realtime/CHANGES.md",
                  correspondsToURL : "https://\(baseDestinationURL)/community/governance/gtfs_realtime_amendment_process/",
                  notes            : "Text https://github.com/MobilityData/awesome-transit/blob/master/README.md google/transit is taken https://github.com/MobilityData/awesome-transit/blob/master/README.md line 5 onwards and pasted in \(baseDestinationURL) starting on line 9 "),
    PageToMonitor(targetRepo       : "MobilityData/awesome-transit",
                  monitorPageAtURL : "README.md",
                  correspondsToURL : "https://\(baseDestinationURL)/resources/",
                  notes            : "Monitors intro, table of contents, about and license sections. The corresponding URL is actually every section in Resources (from Overview to Other), since this script can't detect changes in anchors of files to monitor, therefore you need to match anchors with each sections listed below.<br><br>• https://\(baseDestinationURL)/resources/overview/<br>• https://\(baseDestinationURL)/resources/community/<br>• https://\(baseDestinationURL)/resources/data/<br>• https://\(baseDestinationURL)/resources/software-for-creating-apis/<br>• https://\(baseDestinationURL)/resources/agency-tools/<br>• https://\(baseDestinationURL)/resources/hardware/<br>• https://\(baseDestinationURL)/resources/apps/<br>• https://\(baseDestinationURL)/resources/sdk/<br>• https://\(baseDestinationURL)/resources/visualizations/<br>• https://\(baseDestinationURL)/resources/gtfs/<br>• https://\(baseDestinationURL)/resources/gtfs-realtime/<br>• https://\(baseDestinationURL)/resources/siri/<br>• https://\(baseDestinationURL)/resources/multimodal/<br>• https://\(baseDestinationURL)/resources/other/")
]

// MARK: - Functions

/// Function to make API requests asynchronously using `URLSession`.
/// - Parameters:
///   - url: The URL to which the HTTP request will be made.
///   - method: The HTTP method to use for the request. Defaults to `.GET`. This is an enum that can represent different HTTP methods such as `.GET`, `.POST`, `.PUT`, etc.
///   - body: Optional HTTP body data to be sent with the request. Typically used with methods like `.POST` and `.PUT`.
/// - Returns: The function returns the `Data` received from the HTTP response, or `nil` if the request fails or an error occurs.
/// - Throws: Propagates any errors encountered during the request process, such as network or decoding errors.
func makeRequest(url: URL, method: RESTmethod = .GET, body: Data? = nil) async throws -> Data? {
    if isInDebugMode { print("makeRequest : start") }
    var request: URLRequest = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.addValue(HTTPValue.bearer + githubToken, forHTTPHeaderField: HTTPHeaderField.authorization)
    request.addValue(HTTPValue.applicationVndGithubJson, forHTTPHeaderField: HTTPHeaderField.accept)
    if let body: Data = body { request.httpBody = body }

    do {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            if isInDebugMode { print("HTTP Status Code: \(httpResponse.statusCode)") }
//            if isInDebugMode { print("Headers: \(httpResponse.allHeaderFields)") }
            if isInDebugMode { if !(200...299).contains(httpResponse.statusCode) { print("Server Error: \(httpResponse.statusCode)") ; return nil } }
        }
        
        if isInDebugMode { print("makeRequest : end") }
        if isInDebugMode { print("\n\ndata: \(String(data: data, encoding: .utf8) ?? "nil")\n") }
        return data
    } catch {
        print("Error in makeRequest: \(error)")
        throw error
    }
    
}

/// Function to fetch the commit history for a specific file in a target repository asynchronously.
/// - Parameters:
///   - forFilePath: The relative path of the file in the repository for which the commit history is to be fetched.
///   - targetRepo: The repository from which the commit history is to be fetched, specified in the format "owner/repo".
/// - Returns: An array of dictionaries, where each dictionary represents a commit. If an error occurs during the request or parsing, the function returns an empty array.
/// - Throws: Propagates any errors encountered during the request or JSON serialization.
func fetchCommits(forFilePath: String, targetRepo: String) async throws -> [[String: Any]] {
    if isInDebugMode { print("fetchCommits : start") }
    let url: URL = URL(string: "https://api.github.com/repos/\(targetRepo)/commits?path=\(forFilePath)&since=\(sinceDateIso8601)")!
    guard let data: Data = try await makeRequest(url: url),
          let json: [[String: Any]] = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else { return [] }
    if isInDebugMode { print("fetchCommits : end\n\njson:\n\n\(json)\n\n") }
    return json
}

/// Function to fetch the files modified in a commit
/// - Parameters:
///   - commitSha:  The SHA hash of the commit for which modified files are to be fetched.
///   - targetRepo: The repository from which the modified files are to be fetched, specified in the format "owner/repo".
/// - Returns: An array of strings, where each string represents the file path of a modified file in the specified commit. If an error occurs during the request or parsing, the function returns an empty array.
func fetchModifiedFiles(commitSha: String, targetRepo: String) async throws -> [String] {
    if isInDebugMode { print("fetchModifiedFiles : start") }
    let url : URL = URL(string: "https://api.github.com/repos/\(targetRepo)/commits/\(commitSha)")!
    guard let data  : Data             = try await makeRequest(url: url),
          let json  : [String : Any]   = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
          let files : [[String : Any]] = json["files"] as? [[String: Any]] else { return [] }
    if isInDebugMode { print("fetchModifiedFiles : start") }
    return files.compactMap { $0["filename"] as? String }
}

// MARK: - Main

/// Iterates through a list of pages to monitor, fetches recent commits for each monitored file, collects the modified files and commit URLs, and stores them for later use.
/// - Parameters:
///   - pagesToMonitor (Array of PageToMonitor): An array of PageToMonitor structs, each representing a file to monitor, its corresponding URL, notes, and the target repository.
///   - modifiedFiles (Array of String): A collection of file paths that have been modified in the monitored commits.
///   - commitUrls (Dictionary of [String: [String]]): A dictionary where the key is the monitored file URL and the value is an array of commit URLs that modified this file.

/// 1.    Iterate Through Monitored Pages:
///      • The code iterates over each page in the pagesToMonitor array.
/// 2.    Fetch Recent Commits:
///      • For each page, it calls fetchCommits(forFilePath:page.monitorPageAtURL, repo:page.targetRepo) to get an array of commit dictionaries related to the monitored file.
/// 3.    Process Each Commit:
///      • For each commit in the retrieved commits:
///          • It checks if the commit dictionary contains a "sha" key and extracts the commit SHA.
///          • It calls fetchModifiedFiles(commitSha: sha, repo: page.targetRepo) to get an array of modified file paths for the given commit SHA.
///          • It appends the modified file paths to the modifiedFiles array.
/// 4.    Store Commit URLs:
///      • If the commit dictionary contains an "html_url" key, it extracts the commit URL.
///      • It checks if the monitored file URL already has an entry in the commitUrls dictionary:
///          • If it does, it appends the commit URL to the existing array.
///          • If it doesn’t, it creates a new array with the commit URL and assigns it to the dictionary key.

/// Start the script
try await startScript()

/// Function to start the script that processes monitored pages, fetches commit history, and collects modified files asynchronously.
/// - Throws: Propagates any errors encountered during the fetch of commits or modified files.
/// - Discussion:
///   - This function iterates through the `pagesToMonitor` array. For each page, it fetches the commit history from the target repository.
///   - For each commit, it retrieves the list of modified files and stores them. It also collects the URLs of the commits.
///   - The results are stored in two arrays: `modifiedFiles` for the modified files and `commitUrls` for the URLs of the commits associated with each monitored page.
func startScript() async throws {
    if isInDebugMode { print("==== START SCRIPT ====") }
    if isInDebugMode { print("Cycle through the Pages to Monitor array") }
    var modifiedFiles : [String] = []
    var commitUrls    : [String: [String]] = [:]  // Change the value type to [String]
    for page: PageToMonitor in pagesToMonitor {
        let commits: [[String: Any]] = try await fetchCommits(forFilePath: page.monitorPageAtURL, targetRepo: page.targetRepo)
        for commit: [String: Any] in commits {
            if let sha: String = commit["sha"] as? String {
                let files: [String] = try await fetchModifiedFiles(commitSha: sha, targetRepo: page.targetRepo)
                modifiedFiles.append(contentsOf: files)
                if let commitUrl: String = commit["html_url"] as? String {
                    if commitUrls[page.monitorPageAtURL] != nil {
                        commitUrls[page.monitorPageAtURL]?.append(commitUrl)
                    } else {
                        commitUrls[page.monitorPageAtURL] = [commitUrl]  // Initialize with an array containing the first URL
                    }
                }
            }
        }
    }
    processCommits(modifiedFiles: modifiedFiles, commitUrls: commitUrls)
}

/// Processes the collected modified files and commit URLs, filters the monitored files, constructs the content for a pull request (PR), and sets the output variables for the GitHub Action to use.
/// - Parameters:
///   - modifiedFiles: An array of strings representing file paths that have been modified in the monitored commits.
///   - commitUrls: A dictionary where the key is the monitored file URL, and the value is an array of commit URLs associated with modifications to that file.
/// - Discussion:
///   1. **Filter and Identify Modified Files:** If there are modified files, the function creates a unique list and filters the monitored files that match these modifications.
///   2. **Construct PR Content:** If any monitored files are identified, the function generates a branch name and constructs the PR content. This includes a table with file information, commit URLs, and notes formatted for display.
///   3. **Set GitHub Action Outputs:** The function sets the output variables `branch_name`, `issue_title`, and `issue_body` with the constructed content for the next step in the GitHub Action workflow.
///   4. **No Changes Detected:** If no modified files are found, the function sets the `found_commits` output to `false` and clears the other output variables.
/// - Note: This function prints the PR content and GitHub Action outputs for debugging when `isInDebugMode` is enabled.
func processCommits(modifiedFiles: [String], commitUrls: [String: [String]]) {
    if isInDebugMode { print("Build table and write to GH Output") }
    if !modifiedFiles.isEmpty {
        let uniqueFiles : [String] = Array(Set(modifiedFiles))
        let monitoredFiles : [PageToMonitor] = pagesToMonitor.filter { monitorPage in
            uniqueFiles.contains { $0.contains(monitorPage.monitorPageAtURL) }
        }
        
        if !monitoredFiles.isEmpty {
            let branchName : String = "daily-report-\(currentDateComponents.year ?? 0)-\(currentDateComponents.month ?? 0)-\(currentDateComponents.day ?? 0)"
            
            let issueBodyContents : String = "| File being watched | Corresponding URL on \(baseDestinationURL) | Commit | Notes |\n|--------------------|-------------------------------|--------|-------|\n" + monitoredFiles.map { page in
                var commits: String = ""
                if let urls: [String] = commitUrls[page.monitorPageAtURL] {
                    for url: String in urls {
                        commits += "* \(url)<br>"
                    }
                } else {
                    commits = "No commits"
                }
                return "| [\(page.monitorPageAtURL)](\(page.monitorPageAtURL)) | [\(page.correspondsToURL)](\(page.correspondsToURL)) | \(commits) | \(page.notes) |"
            }.joined(separator: "\n")
            
            let issueBody : String = issueBody + "\n\n" + issueBodyContents
            
            if isInDebugMode { print("issueBody : \n\n \(issueBody)") }
            
            let output: [String: Any] = [
                "found_commits": true,
                "branch_name": branchName,
                "issue_title": issueTitle,
                "issue_body": issueBody
            ]
            
            if let jsonData : Data = try? JSONSerialization.data(withJSONObject: output, options: []),
               let jsonString : String = String(data: jsonData, encoding: .utf8) { print(jsonString) }
        }
    } else {
        
        let output: [String: Any] = [
            "found_commits": false,
            "branch_name": "",
            "issue_title": "",
            "issue_body": ""
        ]
        
        if let jsonData : Data = try? JSONSerialization.data(withJSONObject: output, options: []),
           let jsonString : String = String(data: jsonData, encoding: .utf8) { print(jsonString) }
    }
}