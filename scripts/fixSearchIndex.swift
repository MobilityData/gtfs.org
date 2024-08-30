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
let searchIndexPath: String = "/site/search/search_index.json"

/// Constructs the full path to the JSON file by appending the relative path to the parent directory of the current script location.
var fileLocationURL: URL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    .deletingLastPathComponent()
    .appendingPathComponent(searchIndexPath, isDirectory: false)

/// Reads the contents of the JSON file into a Data object.
let indexData : Data = try Data(contentsOf: fileLocationURL)

/// Decodes the JSON data into a SearchIndex structure.
let searchIndex : SearchIndex = try JSONDecoder().decode(SearchIndex.self, from: indexData)

/// A mutable copy of the original search index, which will be modified during the script.
var newSearchIndex : SearchIndex = searchIndex

/// An array that will hold the filtered documents.
var searchIndexDocs : [SearchIndexDocs] = [SearchIndexDocs]()

/// An array of prefixes used to filter documents based on their location. Any prefix not in this array will be removed.
let prefixes : [String] = ["en/", "es/", "fr/", "ja/"] // Other options: "ja/", "id/", "de/", "pt/", "ru/", "ko/", "zh/", "zh-TW/"

/// Iterates over each document in the search index and filters out any document whose location starts with any of the specified prefixes.
for doc : SearchIndexDocs in newSearchIndex.docs { if prefixes.allSatisfy({ !doc.location.starts(with: $0) }) { searchIndexDocs.append(doc) } }

/// Updates the docs property of the new search index with the filtered documents.
newSearchIndex.docs = searchIndexDocs

/// Encodes the modified search index back to JSON and writes it to the original file location.
try JSONEncoder().encode(newSearchIndex).write(to: fileLocationURL)