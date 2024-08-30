#!/usr/bin/swift

import Foundation

/// Represents the structure of the search index JSON file.
struct SearchIndex : Codable {
    let config : SearchIndexConfig
    var docs   : [SearchIndexDocs]
}

/// Holds configuration details of the search index.
struct SearchIndexConfig : Codable {
    let lang      : [String]
    let separator : String

    enum CodingKeys : String, CodingKey {
        case lang
        case separator
    }
}

/// Represents individual documents within the search index.
struct SearchIndexDocs: Codable {
    let location : String
    let text     : String
    let title    : String
}

/// The path to the search index JSON file, relative to the base folder of the Git repository.
let searchIndexPath: String = "site/search/search_index.json"

/// Constructs the full path to the JSON file by appending the relative path to the parent directory of the current script location.
var fileLocationURL: URL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    .appendingPathComponent(searchIndexPath, isDirectory: false)

/// Check if the file exists, if not, print an error message and exit.
guard FileManager.default.fileExists(atPath: fileLocationURL.path) else {
    print("Error: File not found at \(fileLocationURL.path)")
    exit(1) // Exits the program with a status code of 1 indicating an error.
}

do {
    /// Reads the contents of the JSON file into a Data object.
    let indexData: Data = try Data(contentsOf: fileLocationURL)
    
    /// Decodes the JSON data into a SearchIndex structure.
    let searchIndex: SearchIndex = try JSONDecoder().decode(SearchIndex.self, from: indexData)
    
    /// A mutable copy of the original search index, which will be modified during the script.
    var newSearchIndex: SearchIndex = searchIndex
    
    /// An array that will hold the filtered documents.
    var searchIndexDocs: [SearchIndexDocs] = []
    
    /// An array of prefixes used to filter documents based on their location. Any prefix not in this array will be removed.
    let prefixes: [String] = ["en/", "es/", "fr/"] // Other options: "ja/", "id/", "de/", "pt/", "ru/", "ko/", "zh/", "zh-TW/"

    /// Count the number of documents that match the prefixes before filtering.
    let initialCount: Int = searchIndex.docs.filter { doc in
        prefixes.contains(where: { doc.location.starts(with: $0) })
    }.count

    /// Iterates over each document in the search index and filters out any document whose location starts with any of the specified prefixes.
    for doc : SearchIndexDocs in newSearchIndex.docs {
        if prefixes.allSatisfy({ !doc.location.starts(with: $0) }) {
            searchIndexDocs.append(doc)
        }
    }

    /// Count the number of documents that match the prefixes after filtering.
    let finalCount : Int = searchIndexDocs.count

    /// Print the number of languages removed
    print("Removed \(initialCount-finalCount) items from \(initialCount).")

    /// Updates the docs property of the new search index with the filtered documents.
    newSearchIndex.docs = searchIndexDocs

    /// Encodes the modified search index back to JSON and writes it to the original file location.
    try JSONEncoder().encode(newSearchIndex).write(to: fileLocationURL)

} catch {
    print("Error: \(error)")
    exit(1)
}