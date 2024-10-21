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

// MARK: - Constants

let isInDebugMode          : Bool   = true
let baseDestinationURL     : String = "gtfs.org"
let numberOfDaysToLookBack : Int    = 7
let baseName               : String = "main"
let prRepo                 : String = "MobilityData/\(baseDestinationURL)"
let prAssignees            : String = "[\"Sergiodero,tzujenchanmbd\"]" // needs to be a list. Ex: ["name1,name2"]
let prLabels               : String = "[\"automated-content-update\"]" // needs to be a list. Ex: ["label1,label2"]
let issueTitle             : String = "Daily Report: Modified Files on remote repos (\(currentDateComponents.year ?? 0)-\(currentDateComponents.month ?? 0)-\(currentDateComponents.day ?? 0))"
let prBody                 : String = "The following files have been modified in the last \(numberOfDaysToLookBack) day(s):\n"


// MARK: - Configuration

let githubToken    : String = ProcessInfo.processInfo.environment["GITHUB_TOKEN"]!
// Captures the token in the action step when formulated like this:
//    - name: Run Swift script
//      id: run-swift-script
//      run: swift /path/to/your/script.swift
//      env:
//        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

let githubDateTimeFormat : String        = "yyyy-MM-dd'T'HH:mm:ss'Z'"  // Github requires dates be formatted like this : YYYY-MM-DDTHH:MM:SSZ
let currentDate          : Date          = Date() ; let currentDateComponents : DateComponents = Calendar.current.dateComponents([.day, .year, .month], from: currentDate)
let sinceDate            : Date          = Calendar.current.date(byAdding: .day, value: -numberOfDaysToLookBack, to: Date())!
let iso8601Formatter     : DateFormatter = DateFormatter() ; iso8601Formatter.dateFormat = githubDateTimeFormat
let sinceDateIso8601     : String        = iso8601Formatter.string(from: sinceDate)

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

/// Function to make API requests
/// - Parameters:
///   - url: The URL to which the HTTP request will be made.
///   - method: The HTTP method to use for the request, defaults to `.GET`. This is an enum with possible values like `.GET`, `.POST`, `.PUT`, etc.
///   - body: The HTTP body data to be sent with the request. This is typically used with methods like `.POST` and `.PUT`.
/// - Returns: The function returns the data received from the HTTP response. If the request fails or there is no data, it returns `nil``.
func makeRequest(url: URL, method: RESTmethod = .GET, body: Data? = nil) -> Data? {
    if isInDebugMode { print("makeRequest : start") }
    var request : URLRequest = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.addValue(HTTPValue.bearer + githubToken, forHTTPHeaderField: HTTPHeaderField.authorization)
    request.addValue(HTTPValue.applicationVndGithubJson, forHTTPHeaderField: HTTPHeaderField.accept)
    if let body : Data = body { request.httpBody = body }
    
    let semaphore : DispatchSemaphore = DispatchSemaphore(value: 0)
    var data: Data? = nil
    
    let task : URLSessionDataTask = URLSession.shared.dataTask(with: request) { ( responseData : Data?, _ : URLResponse?, _ : (any Error)?) in
        DispatchQueue.main.async {
            data = responseData
            semaphore.signal()
        }
    }
    
    task.resume() ; _ = semaphore.wait(timeout: .distantFuture)  // Make the semaphore pause the runtime until incremented
    if isInDebugMode { print("makeRequest : end") }
    return data
}

/// Function to fetch commits for a specific file in the target repository
/// - Parameters:
///   - forFilePath: The relative path of the file in the repository for which commit history is to be fetched.
///   - targetRepo: The repository from which the commit history is to be fetched, specified in the format "owner/repo".
/// - Returns: An array of dictionaries, where each dictionary represents a commit. If an error occurs during the request or parsing, the function returns an empty array.
func fetchCommits(forFilePath: String, targetRepo: String) -> [[String: Any]] {
    if isInDebugMode { print("fetchCommits : start") }
    let url: URL = URL(string: "https://api.github.com/repos/\(targetRepo)/commits?path=\(forFilePath)&since=\(sinceDateIso8601)")!
    guard let data: Data = makeRequest(url: url),
          let json: [[String: Any]] = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else { return [] }
    if isInDebugMode { print("fetchCommits : end") }
    return json
}

/// Function to fetch the files modified in a commit
/// - Parameters:
///   - commitSha:  The SHA hash of the commit for which modified files are to be fetched.
///   - targetRepo: The repository from which the modified files are to be fetched, specified in the format "owner/repo".
/// - Returns: An array of strings, where each string represents the file path of a modified file in the specified commit. If an error occurs during the request or parsing, the function returns an empty array.
func fetchModifiedFiles(commitSha: String, targetRepo: String) -> [String] {
    if isInDebugMode { print("fetchModifiedFiles : start") }
    let url : URL = URL(string: "https://api.github.com/repos/\(targetRepo)/commits/\(commitSha)")!
    guard let data  : Data             = makeRequest(url: url),
          let json  : [String : Any]   = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
          let files : [[String : Any]] = json["files"] as? [[String: Any]] else { return [] }
    if isInDebugMode { print("fetchModifiedFiles : start") }
    return files.compactMap { $0["filename"] as? String }
}

/// Writes a key-value pair to the `$GITHUB_OUTPUT` environment variable to be used between steps in a GitHub Actions workflow.
///
/// This function takes a key and its corresponding value and writes it to `$GITHUB_OUTPUT`, which allows subsequent steps in a GitHub Actions workflow to access this output.
///
/// Example:
/// ```
/// setGitHubOutput(key: "branch_name", value: "feature-branch")
/// ```
///
/// - Parameters:
///   - key: The key to be used in the output, which will be referenced in subsequent steps.
///   - value: The value corresponding to the key that will be stored in the output.
func setGitHubOutput(key: String, value: String) {
    if isInDebugMode { print("setGitHubOutput : start") }
    let task : Process = Process()
    task.executableURL = URL(fileURLWithPath: "/bin/bash")
    
    // Wrap value in double quotes to handle special characters
    let quotedValue : String = "\"\(value)\""
    task.arguments = ["-c", "echo \(key)=\(quotedValue) >> $GITHUB_OUTPUT"]
    
    do {
        try task.run()
        task.waitUntilExit()
    } catch {
        print("Failed to run task: \(error)")
    }
}

// MARK: - Main

/// Iterates through a list of pages to monitor, fetches recent commits for each monitored file, collects the modified files and commit URLs, and stores them for later use.
/// - Parameters:
///   - pagesToMonitor (Array of PageToMonitor): An array of PageToMonitor structs, each representing a file to monitor, its corresponding URL, notes, and the target repository.
///   - modifiedFiles (Array of String): A collection of file paths that have been modified in the monitored commits.
///   - commitUrls (Dictionary of [String: [String]]): A dictionary where the key is the monitored file URL and the value is an array of commit URLs that modified this file.

/// 1.	Iterate Through Monitored Pages:
///      • The code iterates over each page in the pagesToMonitor array.
/// 2.	Fetch Recent Commits:
///      • For each page, it calls fetchCommits(forFilePath:page.monitorPageAtURL, repo:page.targetRepo) to get an array of commit dictionaries related to the monitored file.
/// 3.	Process Each Commit:
///      • For each commit in the retrieved commits:
///          • It checks if the commit dictionary contains a "sha" key and extracts the commit SHA.
///          • It calls fetchModifiedFiles(commitSha: sha, repo: page.targetRepo) to get an array of modified file paths for the given commit SHA.
///          • It appends the modified file paths to the modifiedFiles array.
/// 4.	Store Commit URLs:
///      • If the commit dictionary contains an "html_url" key, it extracts the commit URL.
///      • It checks if the monitored file URL already has an entry in the commitUrls dictionary:
///          • If it does, it appends the commit URL to the existing array.
///          • If it doesn’t, it creates a new array with the commit URL and assigns it to the dictionary key.

var modifiedFiles : [String] = []
var commitUrls    : [String: [String]] = [:]  // Change the value type to [String]

if isInDebugMode { print("==== START SCRIPT ====") }
if isInDebugMode { print("Cycle through the Pages to Monitor array") }

for page: PageToMonitor in pagesToMonitor {
    let commits: [[String: Any]] = fetchCommits(forFilePath: page.monitorPageAtURL, targetRepo: page.targetRepo)
    for commit: [String: Any] in commits {
        if let sha: String = commit["sha"] as? String {
            let files: [String] = fetchModifiedFiles(commitSha: sha, targetRepo: page.targetRepo)
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

/// Processes the collected modified files and commit URLs, filters the monitored files, constructs the content for a pull request (PR), and sets the output variables for the GitHub Action to use.
/// - Parameters:
///   - modifiedFiles (Array of String): A collection of file paths that have been modified in the monitored commits.
///   - commitUrls (Dictionary of [String: [String]]): A dictionary where the key is the monitored file URL and the value is an array of commit URLs that modified this file.
///   - pagesToMonitor (Array of PageToMonitor): An array of PageToMonitor structs, each representing a file to monitor, its corresponding URL, notes, and the target repository.
///   - currentDateComponents (DateComponents): A date components object representing the current date.
///   - issueTitle (String): The title of the pull request.
///   - issueBody (String): The body content of the pull request.

/// 1.	Filter and Identify Modified Files: If there are modified files, it creates a unique list and filters the monitored files that match these modifications.
/// 2.	Construct PR Content: If there are any matching monitored files, it generates a branch name and constructs the PR content, including a table of file information and commit URLs formatted for display.
/// 3.	Set GitHub Action Outputs: It sets the output variables branch_name, issue_title, and issue_body with the constructed content for the next GitHub Action step to use.

if isInDebugMode { print("Build table and write to GH Output") }
if !modifiedFiles.isEmpty {
    let uniqueFiles : [String] = Array(Set(modifiedFiles))
    let monitoredFiles : [PageToMonitor] = pagesToMonitor.filter { monitorPage in
        uniqueFiles.contains { $0.contains(monitorPage.monitorPageAtURL) }
    }

    if !monitoredFiles.isEmpty {
        let branchName : String = "daily-report-\(currentDateComponents.year ?? 0)-\(currentDateComponents.month ?? 0)-\(currentDateComponents.day ?? 0)"
        
        let prContent: String = "| File being watched | Corresponding URL on \(baseDestinationURL) | Commit | Notes |\n|--------------------|-------------------------------|--------|-------|\n" + monitoredFiles.map { page in
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

        let issueBody : String = prBody + "\n\n" + prContent

        setGitHubOutput(key: "found_commits", value: "true")
        setGitHubOutput(key: "branch_name", value: branchName)
        setGitHubOutput(key: "issue_title", value: issueTitle)
        setGitHubOutput(key: "issue_body", value: issueBody)

        // print("echo found_commits=true >> $GITHUB_OUTPUT")
        // print("echo branch_name=\(branchName) >> $GITHUB_OUTPUT")
        // print("echo issue_title=\(issueTitle) >> $GITHUB_OUTPUT")
        // print("echo issue_body=\(issueBody) >> $GITHUB_OUTPUT")
    }
} else {

        setGitHubOutput(key: "found_commits", value: "false")
        setGitHubOutput(key: "branch_name", value: "")
        setGitHubOutput(key: "issue_title", value: "")
        setGitHubOutput(key: "issue_body", value: "")

        // print("echo found_commits=false >> $GITHUB_OUTPUT")
        // print("echo branch_name=\"\" >> $GITHUB_OUTPUT")
        // print("echo issue_title=\"\" >> $GITHUB_OUTPUT")
        // print("echo issue_body=\"\" >> $GITHUB_OUTPUT")
}