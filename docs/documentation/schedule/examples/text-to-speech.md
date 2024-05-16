# Text-to-speech

## Abbreviations, unusual pronunciations, large digits and ordinals

Abbreviations, unusual pronunciation and large digits are common to GTFS text fields. In the example below for TriMEt, we can see how the text-to-speech field should be used:

- Abbreviations are fully spelled out: e.g. “SW” becomes “southwest”; “Ave” becomess “avenue”.
- Pronunciations are spelled in a way that the software reads them correctly: e.g. “Orenco” becomes “orrainkoe”; “Merlo” becomes “murlo”.
- Large digits are spelled out as they would be said: “3300” becomes “thirty-three hundred”.
Otherwise, the software would read “3300” as “three thousand three hundred”.
- Ordinals, such as 1st, 2nd and 3rd, should be spelled out: e.g. “1st” becomes “first”.

[**stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name | tts_stop_name |
| ---- | ---- | ---- |
| 9163 | SW 125th & Longhorn | southwest one hundred twenty fifth & longhorn |
| 9836 | Orenco MAX Station | orrainkoe max station |
| 9828 | Merlo Rd/SW 158th Ave MAX Station | murlo road southwest one hundred fifty eighth avenue max station |
| 10074 | 3300 Block NW 35th | thirty-three-hundred block northwest thirty fifth |

## Acronyms

For acronyms that are referred to by their letters, letters should be followed by periods or separated by spaces. This clarifies that the acronym should be read letter-by-letter, and not as a word.

For Tampa, the headsign “North to UATC” contains an acronym that is pronounced by its individual letters. The text-to-speech disambiguation would be:

[**trips.txt**](../../reference/#tripstxt)

| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u.a.t.c. |

or

| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u a t c |

Conversely, some acronyms should be read as words: e.g. NATO; NASA. The text-to-speech field should reflect this.

!!! Note

    The field `trips.tts_trip_headsign` is not yet official in the specification.

## Clarifying abbreviations with multiple meanings

The “St” abbreviation has multiple meanings: “street”, “saint”, “station” and “1st” to mean “first”. The text-to-speech field can address these double meanings by spelling out the correct word, and doing so in a way that is legible by the TTS software.