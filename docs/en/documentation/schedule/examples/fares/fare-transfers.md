# Fare Transfers

*Main files: fare_leg_rules.txt, fare_transfer_rules.txt*  
*Example: [Translink (Vancouver)](../intro/#translink-vancouver)*

!!! info "Reminder"

    Fare Transfers is used to define rules applicable when transferring between legs. The journey’s total cost is derived from the fare products applied to individual legs and to the transfers connecting them. For more information revisit the [Features section](../intro/#fares-features-and-their-files) in the Introduction page.

!!! info "Reminder"

    For TransLink:

    * Transfers are valid for 90 minutes after fare validation.  
    * Bus-to-bus transfers within this time period are free.  
    * Transfers within the same fare zone number (as supported by the original fare) are also free.  
    * If the rider transfers to a zone with a higher fare, they only pay the difference, known as an AddFare.

## Create transfer fare products

Transfer fare products represent the cost of transfers that are not free. Free transfers do not have to be created. Transfer fare products are created in `fare_products.txt` as follows:

1. Fill the **fare_product_id** column with a unique ID identifying the fare product.  
2. Fill the **fare_product_name** column with the rider-facing name of the fare product (e.g., Zone 1 to Zone 2 Transfer Upgrade, Bus to Zone 1 Transfer Upgrade).  
3. Fill the **amount** and **currency** columns with the cost of the transfer and its currency ([currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)).  
4. Fill the **fare_media_id** column with the fare media where this fare product can be stored and used.  
   * This is a Foreign Key referencing **fare_media_id** in `fare_media.txt` ([Fare Media](../../../reference/#fare_mediatxt)).  
   * Multiple fare media can be associated with the same fare product, potentially at different prices.  
   * An empty **fare_media_id** means that the fare media is unknown.

[Consult the documentation](../../../reference/#fare_productstxt) for more details on fare products.

In [Translink’s](../intro/#translink-vancouver) case, three transfer fare products are created.

* `1_zone_to_2_zone_upgrade` represents the cost of transferring from a 1-zone fare to a 2-zone fare. Which is CAD 4.65 - CAD 3.20 = CAD 1.45 (or CAD 9.65 - CAD 8.20 = CAD 1.45 for legs that start from Sea Island)  
* `2_zone_to_3_zone_upgrade` represents the cost of transferring from a 2-zone fare to a 2-zone fare. Which is CAD 6.35 - CAD 4.65 = CAD 1.70 (or CAD 11.35 - CAD 9.65 = CAD 1.70 for legs that start from Sea Island)  
* `1_zone_to_3_zone_upgrade` represents the cost of transferring from a 1-zone fare to a 2-zone fare. Which is CAD 6.35 - CAD 3.20 = CAD 3.15

**fare_products.txt**

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| … | … | … | … | … |
| 1_zone_to_2_zone_upgrade | 1 zone  to 2 zones upgrade | 1,45 | CAD | contactless |
| 2_zone_to_3_zone_upgrade | 2 zones  to 3 zones upgrade | 1.70 | CAD | contactless |
| 1_zone_to_3_zone_upgrade | 1 zone  to 3 zones upgrade | 3.15 | CAD | contactless |

## Create transfer rules

Transfers rules allow the possible transfers to be applied to eligible legs of a journey. They are created in `fare_transfer_rules.txt` as follows:

1. Fill **from_leg_group_id** and **to_leg_group_id**.  
   * These are Foreign Keys referencing **leg_group_id** from `fare_leg_rules.txt`. They reference respectively the pre-transfer leg group and the post-transfer leg group.  
2. Fill **duration_limit** to the number of seconds for which the transfer remains valid, if there is no time limit, leave empty.  
   Fill **duration_limit_type** If **duration_limit** is not empty.  **duration_limit_type** describes how to calculate the bounds of **duration_limit**.  
3. Fill **fare_transfer_type** to explain how the fare is calculated.  
4. Fill **transfer_count** if there is a limit on the number of transfers. This field is required for transfers where **from_leg_group_id**=**to_leg_group_id** and forbidden otherwise.

[Consult the documentation](../../../reference/#fare_transfer_rulestxt) to learn more about the different values for transfer rules.

In this example, multiple transfers are defined between all possible leg groups of Translink. All transfers are valid for 5400 seconds (180 minutes). The **duration_limit_type** is set to 1, since the transfer time starts when the rider departs on any route in the **flat_fare_leg fare leg** and ends when they depart on a different fare leg.

The **fare_transfer_type** is set to 0. This is also called an A + AB transfer, where the rider pays the first leg fare (A) plus a transfer fare to B (AB). Finally, **transfer_count** is set to -1 since there is no limit on the number of transfers permitted.

**fare_transfer_rules.txt**

| from_leg_group_id | from_leg_group_id | duration_limit | duration_limit_type | transfer_count | fare_transfer_type | fare_product_id |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | flat_fare_leg | 5400 | 1 | -1 | 0 |  |
| ZN1_ZN1 | flat_fare_leg | 5400 | 1 | -1 | 0 |  |
| flat_fare_leg | ZN1_ZN1 | 5400 | 1 | -1 | 0 |  |
| ZN1_ZN2 | flat_fare_leg | 5400 | 1 | -1 | 0 |  |
| flat_fare_leg | ZN1_ZN2 | 5400 | 1 | -1 | 0 | 1_zone_to_2_zone_upgrade |
| ZN2_ZN2 | flat_fare_leg | 5400 | 1 | -1 | 0 |  |
| flat_fare_leg | ZN2_ZN2 | 5400 | 1 | -1 | 0 |  |
| … | … | … | … | … | … | … |
| ZN1_ZN1 | ZN1_ZN2 | 5400 | 1 | -1 | 0 | 1_zone_to_2_zone_upgrade |
| ZN1_ZN1 | ZN1_ZN3 | 5400 | 1 |  | 0 | 1_zone_to_3_zone_upgrade |
| ZN1_ZN2 | ZN2_ZN2 | 5400 | 1 |  | 0 |  |
| ZN1_ZN2 | ZN1_ZN2 | 5400 | 1 |  | 0 |  |
| ZN1_ZN2 | ZN2_ZN3 | 5400 | 1 |  | 0 | 2_zone_to_3_zone_upgrade |
| … | … | … | … |  | … | … |

## Enable Nonconsecutive Transfers

!!! Warning

    Nonconsecutive transfers are still under development and not yet part of the official specification. However, they have been included in this guide to provide a comprehensive overview of the Fare implementation for Translink.

    For more details on nonconsecutive transfers, refer to the associated [pull request](https://github.com/google/transit/pull/498) and [proposal](https://docs.google.com/document/d/1HBskmMx32W7whP-fQGlNlv0c1rgIe0jS8Dm4Rp3R_2I/edit?usp=sharing).

Nonconsecutive transfers are required when one leg of a journey affects a later, non-adjacent leg. When nonconsecutive transfers are enabled for a transfer rule, that transfer rule can be applied between both consecutive and nonconsecutive legs. This ensures that all possible transfer combinations are considered.

Nonconsecutive transfers are required when one leg of a journey affects a later, non-adjacent leg.

Nonconsecutive transfers are enabled in `fare_transfer_rules.txt` as follows:

1. Fill **nonconsecutive_transfers_allowed** with 1 if the transfer rule can occur between nonconsecutive legs, otherwise set it to 0 or leave it empty.

!!! info "Reminder"

    Translink has a validity window of 90min. e.g. If a rider starts a journey from Zone 1 to Zone 2 (2-zone fare paid), then goes from Zone 2 to Zone 2 (0 transfer fee paid), then finally from Zone 2 back to Zone 1, the rider only pays the first 2-zone fare.

In [Translink’s](../intro/#translink-vancouver) system, a rider might take the following 80-minute journey across various services:

* **Leg 1**: From Lonsdale Quay (Zone 2) to Waterfront Station (Zone 1) via the Seabus — this requires a 2-zone fare.

* **Leg 2**: From Waterfront Station (Zone 1) to Commercial-Broadway Station (Zone 1) via SkyTrain — this requires a 1-zone fare.

* **Leg 3**: From Commercial-Broadway Station (Zone 1) to Lake City Way Station (Zone 2) via SkyTrain — this requires a 2-zone fare.

The fare for Leg 1 should cover all 2-zone trips between Zone 1 and Zone 2 within a 90-minute window. Therefore, the total cost is calculated as:

* Leg 1 (2-zone fare) + transfer from Leg 1 to Leg 2 + transfer from Leg 1 to Leg 3 = CAD 4.65 + CAD 0.00 + CAD 0.00 = CAD 4.65

This calculation works by setting `nonconsecutive_transfers_allowed` to 1 in `fare_transfer_rules.txt`, ensuring that the zones crossed in the first leg influence subsequent transfers across all legs in a multi-leg journey.

Without enabling nonconsecutive transfers, the fare would be incorrectly calculated as:

* Leg 1 + transfer from Leg 1 to Leg 2 + transfer from Leg 2 to Leg 3 = CAD 4.65 + CAD 0.00 + CAD 1.65 = CAD 6.30

The second fares would not reflect how fares are intended to work in practice. Thus, enabling nonconsecutive transfers ensures accurate fare calculations by considering all valid transfer possibilities.

**fare_transfer_rules.txt**

| from_leg_group_id | from_leg_group_id | duration_limit | duration_limit_type | transfer_count | fare_transfer_type | fare_product_id | nonconsecutive_transfers_allowed |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | flat_fare_leg | 5400 | 1 | -1 | 0 |  | 1 |
| ZN1_ZN1 | flat_fare_leg | 5400 | 1 | -1 | 0 |  | 1 |
| flat_fare_leg | ZN1_ZN1 | 5400 | 1 | -1 | 0 |  | 1 |
| ZN1_ZN2 | flat_fare_leg | 5400 | 1 | -1 | 0 |  | 1 |
| flat_fare_leg | ZN1_ZN2 | 5400 | 1 | -1 | 0 | 1_zone_to_2_zone_upgrade | 1 |
| ZN2_ZN2 | flat_fare_leg | 5400 | 1 | -1 | 0 |  | 1 |
| flat_fare_leg | ZN2_ZN2 | 5400 | 1 | -1 | 0 |  | 1 |
| … | … | … | … | … | … | … | 1 |
| ZN1_ZN1 | ZN1_ZN2 | 5400 | 1 | -1 | 0 | 1_zone_to_2_zone_upgrade | 1 |
| ZN1_ZN1 | ZN1_ZN3 | 5400 | 1 | -1 | 0 | 1_zone_to_3_zone_upgrade | 1 |
| ZN1_ZN2 | ZN2_ZN2 | 5400 | 1 | -1 | 0 |  | 1 |
| ZN1_ZN2 | ZN1_ZN2 | 5400 | 1 | -1 | 0 |  | 1 |
| ZN1_ZN2 | ZN2_ZN3 | 5400 | 1 | -1 | 0 | 2_zone_to_3_zone_upgrade | 1 |
| … | … | … | … | -1 | … | … | 1 |
