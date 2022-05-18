### fare_products.txt

File: **Optional**

Primary Key (`fare_product_id`)

To describe the different types of tickets or fares that can be purchased by riders.

|  Field Name | Type | Presence | Description |
|  ------ | ------ | ------ | ------ |
| `fare_product_id` |  ID | **Required** | Identifies a fare product. |
| `fare_product_name` | Text | Optional | The name of the fare product as displayed to riders. |
| `amount` | Currency amount | **Required** | The cost of the fare product. May be negative to represent transfer discounts. May be zero to represent a fare product that is free.|
| `currency` | Currency code | **Required** | The currency of the cost of the fare product. |

