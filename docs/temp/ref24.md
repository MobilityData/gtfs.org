### fare_transfer_rules.txt

File: **Optional**

Primary Key (`from_leg_group_id, to_leg_group_id, fare_product_id, transfer_count, duration_limit`)

Fare rules for transfers between legs of travel defined in [`fare_leg_rules.txt`](#fare_leg_rulestxt).

To process the cost of a multi-leg journey:

1. The applicable fare leg groups defined in `fare_leg_rules.txt` should be determined for all individual legs of travel based on the rider’s journey.
2. The file `fare_transfer_rules.txt` must be filtered by the fields that define the characteristics of the transfer, these fields are:
    - `fare_transfer_rules.from_leg_group_id`
    - `fare_transfer_rules.to_leg_group_id`<br/>
    <br/>

3. If the transfer exactly matches a record in `fare_transfer_rules.txt` based on the characteristics of the transfer, then that record must be processed to determine the transfer cost.
4. If no exact matches are found, then empty entries in `from_leg_group_id` or in `to_leg_group_id` must be checked to process the transfer cost:
    - An empty entry in `fare_transfer_rules.from_leg_group_id` corresponds to all leg groups defined under `fare_leg_rules.leg_group_id` excluding the ones listed under `fare_transfer_rules.from_leg_group_id`
    - An empty entry in `fare_transfer_rules.to_leg_group_id` corresponds to all leg groups defined under `fare_leg_rules.leg_group_id` excluding the ones listed under `fare_transfer_rules.to_leg_group_id`<br/>
    <br/>
5. If the transfer does not match any of the rules described above, then there is no transfer arrangement and the legs are considered separate.

<br/>

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
| `from_leg_group_id` | Foreign ID referencing `fare_leg_rules.leg_group_id` | Optional | Identifies a group of pre-transfer fare leg rules.<br><br>If there are no matching `fare_transfer_rules.from_leg_group_id` values to the `leg_group_id` being filtered, empty `fare_transfer_rules.from_leg_group_id` will be matched by default. <br><br>An empty entry in `fare_transfer_rules.from_leg_group_id` corresponds to all leg groups defined under `fare_leg_rules.leg_group_id` excluding the ones listed under `fare_transfer_rules.from_leg_group_id`|
| `to_leg_group_id` | Foreign ID referencing `fare_leg_rules.leg_group_id` | Optional | Identifies a group of post-transfer fare leg rules.<br><br>If there are no matching `fare_transfer_rules.to_leg_group_id` values to the `leg_group_id` being filtered, empty `fare_transfer_rules.to_leg_group_id` will be matched by default.<br><br>An empty entry in `fare_transfer_rules.to_leg_group_id` corresponds to all leg groups defined under `fare_leg_rules.leg_group_id` excluding the ones listed under `fare_transfer_rules.to_leg_group_id` |
| `transfer_count` | Non-zero integer | **Conditionally Forbidden** | Defines how many consecutive transfers the transfer rule may be applied to.<br><br>Valid options are:<br>`-1` - No limit.<br>`1` or more - Defines how many transfers the transfer rule may span.<br><br>If a sub-journey matches multiple records with different `transfer_count`s, then the rule with the minimum `transfer_count` that is greater than or equal to the current transfer count of the sub-journey is to be selected.<br><br>Conditionally Forbidden:<br>- **Forbidden** if `fare_transfer_rules.from_leg_group_id` does not equal `fare_transfer_rules.to_leg_group_id`.<br>- **Required** if `fare_transfer_rules.from_leg_group_id` equals `fare_transfer_rules.to_leg_group_id`. |
| `duration_limit` | Positive integer | Optional | Defines the duration limit of the transfer.<br><br>Must be expressed in integer increments of seconds.<br><br>If there is no duration limit, `fare_transfer_rules.duration_limit` must be empty. |
| `duration_limit_type` | Enum | **Conditionally Required** | Defines the relative start and end of `fare_transfer_rules.duration_limit`.<br><br>Valid options are:<br>`0` - Between the departure fare validation of the current leg and the arrival fare validation of the next leg.<br>`1` - Between the departure fare validation of the current leg and the departure fare validation of the next leg.<br>`2` - Between the arrival fare validation of the current leg and the departure fare validation of the next leg.<br>`3` - Between the arrival fare validation of the current leg and the arrival fare validation of the next leg.<br><br>Conditionally Required:<br>- **Required** if `fare_transfer_rules.duration_limit` is defined.<br>- **Forbidden** if `fare_transfer_rules.duration_limit` is empty. |
| `fare_transfer_type` | Enum | **Required** | Indicates the cost processing method of transferring between legs in a journey: <br>![](../assets/2-leg.svg) <br>Valid options are:<br>`0` - From-leg `fare_leg_rules.fare_product_id` plus `fare_transfer_rules.fare_product_id`; A + AB.<br>`1` - From-leg `fare_leg_rules.fare_product_id` plus `fare_transfer_rules.fare_product_id` plus to-leg `fare_leg_rules.fare_product_id`; A + AB + B.<br>`2` - `fare_transfer_rules.fare_product_id`; AB. <br><br>Cost processing interactions between multiple transfers in a journey:<br>![](../assets/3-leg.svg)<br><table><thead><tr><th>`fare_transfer_type`</th><th>Processing A > B</th><th>Processing B > C</th></tr></thead><tbody><tr><td>`0`</td><td>A + AB</td><td>S + BC</td></tr><tr><td>`1`</td><td>A + AB +B</td><td>S + BC + C</td></tr><tr><td>`2`</td><td>AB</td><td>S + BC</td></tr></tbody></table>Where S indicates the total processed cost of the preceding leg(s) and transfer(s). |
| `fare_product_id` | Foreign ID referencing `fare_products.fare_product_id` | Optional | The fare product required to transfer between two fare legs. If empty, the cost of the transfer rule is 0.|


