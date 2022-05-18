### levels.txt

File: **Conditionally Required**

Primary key (`level_id`)

Describes levels in a station. Useful in conjunction with `pathways.txt`, and is required for navigating pathways with elevators (`pathway_mode=5`).

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
|  `level_id` | Unique ID | **Required** | Identifies a level in a station.|
|  `level_index` | Float | **Required** | Numeric index of the level that indicates its relative position. <br><br>Ground level should have index `0`, with levels above ground indicated by positive indices and levels below ground by negative indices.|
|  `level_name` | Text | Optional | Name of the level as seen by the rider inside the building or station.<hr>_Example: Take the elevator to "Mezzanine" or "Platform" or "-1"._|


