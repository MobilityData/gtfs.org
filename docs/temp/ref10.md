## File Requirements

The following requirements apply to the format and contents of the dataset files:

* All files must be saved as comma-delimited text.
* The first line of each file must contain field names. Each subsection of the [Field Definitions](#field-definitions) section corresponds to one of the files in a GTFS dataset and lists the field names that may be used in that file.
* All file and field names are case-sensitive.
* Field values must not contain tabs, carriage returns or new lines.
* Field values that contain quotation marks or commas must be enclosed within quotation marks. In addition, each quotation mark in the field value must be preceded with a quotation mark. This is consistent with the manner in which Microsoft Excel outputs comma-delimited (CSV) files. For more information on the CSV file format, see [https://tools.ietf.org/html/rfc4180](https://tools.ietf.org/html/rfc4180).
The following example demonstrates how a field value would appear in a comma-delimited file:
  * **Original field value:** `Contains "quotes", commas and text`
  * **Field value in CSV file:** `"Contains ""quotes"", commas and text"`
* Field values must not contain HTML tags, comments or escape sequences.
* Extra spaces between fields or field names should be removed. Many parsers consider the spaces to be part of the value, which may cause errors.
* Each line must end with a CRLF or LF linebreak character.
* Files should be encoded in UTF-8 to support all Unicode characters. Files that include the Unicode byte-order mark (BOM) character are acceptable. See [https://unicode.org/faq/utf_bom.html#BOM](https://unicode.org/faq/utf_bom.html#BOM) for more information on the BOM character and UTF-8.
* All dataset files must be zipped together.

