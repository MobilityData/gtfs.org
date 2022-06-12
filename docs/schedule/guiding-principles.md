<a href="https://github.com/google/transit/edit/master/gtfs/CHANGES.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.71 7.04c.39-.39.39-1.04 0-1.41l-2.34-2.34c-.37-.39-1.02-.39-1.41 0l-1.84 1.83 3.75 3.75M3 17.25V21h3.75L17.81 9.93l-3.75-3.75L3 17.25Z"></path></svg>
  </a>
  
# Guiding Principles
In order to preserve the original vision of GTFS, a number of guiding principles have been established to take into consideration when extending the spec:

**Feeds should be easy to create and edit**<br>
We chose CSV as the basis for the specification because it's easy to view and edit using spreadsheet programs and text editors, which is helpful for smaller agencies. It's also straightforward to generate from most programming languages and databases, which is good for publishers of larger feeds.

**Feeds should be easy to parse**<br>
Feed readers should be able to extract the information they're looking for with as little work as possible. Changes and additions to the feed should be as broadly useful as possible, to minimize the number of code paths that readers of the feed need to implement. (However, making creation easier should be given precedence, since there will ultimately be more feed publishers than feed readers.)

**The spec is about passenger information**<br>
GTFS is primarily concerned with passenger information. That is, the spec should include information that can help power tools for riders, first and foremost. There is potentially a large amount of operations-oriented information that transit agencies might want to transmit internally between systems. GTFS is not intended for that purpose and there are potentially other operations-oriented data-standards that may be more appropriate.

**Changes to the spec should be backwards-compatible**<br>
When adding features to the specification, we want to avoid making changes that will make existing feeds invalid. We don't want to create more work for existing feed publishers until they want to add capabilities to their feeds. Also, whenever possible, we want existing parsers to be able to continue to read the older parts of newer feeds.

**Speculative features are discouraged**<br>
Every new feature adds complexity to the creation and reading of feeds. Therefore, we want to take care to only add features that we know to be useful. Ideally, any proposal will have been tested by generating data for a real transit system that uses the new feature and writing software to read and display it. Note that the GTFS readily allows for extensions to the format through the addition of extra columns and files that are ignored by the official parsers & validators, so proposals can be easily prototyped and tested on existing feeds.
