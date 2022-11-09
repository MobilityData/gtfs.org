#!/usr/bin/swift

import Foundation

struct SearchIndex: Codable {
    let config: SearchIndexConfig
    var docs: [SearchIndexDocs]
}

//FIXME: Deactivated a few let vars as they were causing errors, they are not present in the JSON file
struct SearchIndexConfig: Codable {
    // let indexing: String
    let lang: [String]
    // let minSearchLength: Int
    // let prebuildIndex: Bool
    let separator: String

    enum CodingKeys: String, CodingKey {
        // case indexing
        case lang
        // case minSearchLength = "min_search_length"
        // case prebuildIndex = "prebuild_index"
        case separator
    }
}

struct SearchIndexDocs: Codable {
    let location: String
    let text: String
    let title: String
}

// The location of the JSON file relatively to the base folder of the git
let searchIndexPath = "/site/search/search_index.json"
// Figure out where the script is located in the system, and go to its parent directory
var fileLocationURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).deletingLastPathComponent()
// Add the path to the JSON file
fileLocationURL = fileLocationURL.appendingPathComponent(searchIndexPath, isDirectory:false)

let indexData = try Data(contentsOf: fileLocationURL)
let searchIndex = try JSONDecoder().decode(SearchIndex.self, from: indexData)
var newSearchIndex = searchIndex
var searchIndexDocs = [SearchIndexDocs]()

for doc in newSearchIndex.docs {
    if !doc.location.starts(with: "en/")
      && !doc.location.starts(with: "id/")
      && !doc.location.starts(with: "de/")
      && !doc.location.starts(with: "es/") 
      && !doc.location.starts(with: "fr/")
      && !doc.location.starts(with: "pt_BR/")
      && !doc.location.starts(with: "ru/")
      && !doc.location.starts(with: "zh/") 
      && !doc.location.starts(with: "ja/")
      && !doc.location.starts(with: "ko/") {
          searchIndexDocs.append(doc)
    }
}

newSearchIndex.docs = searchIndexDocs

try JSONEncoder().encode(newSearchIndex).write(to: fileLocationURL)
