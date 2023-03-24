<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/fares-v2.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Fare Media 

<hr>

The examples below demonstrate how to inform riders what fare media they can bring with them for their trip. See more information about [the Fares v2 extension project here](/extensions/fares-v2/).

In the interim, producers may implement Fares v2 alongside implementation of Fares v1 in the same dataset as there exists no technical conflict between the two. Consumers will have the choice on which implementation to consume independently from the other. 
With adoption and sufficient endorsement of Fares v2, Fares v1 may be deprecated in the future.

## Describe what fare media is accepted 

San Francisco Muni riders can use several different types of fare media to pay for their trip and validate their fare:

- Use a <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">Clipper card,</a> the Bay Area’s transit card
- Use the <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">Munimobile app</a>
- Pay for the fare in cash 

These validation methods are referred to as `fare_media` in GTFS-Fares v2 and can be described using `fare_media.txt`.

Below is an example snippet from the <a href="https://511.org/open-data/transit" target="_blank">San Francisco Bay Area Regional Feed</a> that can be accessed with the 511 SF Bay API. 

`Clipper` is described as a physical transit card with `fare_media_type=2`. `SFMTA Munimobile` is described as a mobile app with `fare_media_type=2`. `Cash` has no fare media, since it is given directly to the driver without a ticket. As a result, `Cash` is `fare_media_type=0`. 

Producers who want to describe a physical ticket as a fare media type can use the experimental `fare_media_type=1` option that is in the <a href="https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd" target="_blank">full Fares v2 proposal</a>.  

[**fare_media.txt**](../../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| munimobile    | SFMTA MuniMobile | 4               |
| cash           | Cash             | 0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">See the San Francisco Bay Area Regional feed</a></sup>

## Define price differences based on fare media

Muni's fare price is different based on the fare media the rider uses. This example will cover how the adult local fare price changes when using cash or Clipper card. An adult local fare paid for with cash costs $3 USD and the same fare paid for with the Clipper card costs $2.50, 50 cents less.

Each entry below describes a fare media.

[**fare_media.txt**](../../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
|---------------|------------------|-----------------|
| clipper       | Clipper          | 2               |
| cash           | Cash             | 0               |

The `fare_products.txt` file snippet below shows how the amount of the `Muni single local fare` product varies depending on the fare media that the rider uses.

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | amount | currency | fare_media_id |
|---------------|------------------|-------|--- |---------------|
| SF:local:single | Muni single local fare | 3     | USD | cash |
| SF:local:single | Muni single local fare  | 2.5   |USD | clipper |

In Apple Maps, riders can see how their fare price changes: 

@TODO Add screenshots, side by side on desktop, 1 column on mobile

<sup><a href="https://511.org/open-data/transit" target="_blank">See the San Francisco Bay Area Regional feed</a></sup>


## Describe a contactless fare media option

<a href="https://vimeo.com/539436401" target="_blank">The Clean Air Express in Northern Santa Barbara County accepts contactless payment</a> by credit card, Google Pay and Apple Pay.

In the Clean Air Express feed, there is a `tap_to_ride` fare media with a  `fare_media_type=3`, since it’s a cEMV (contactless Europay, Mastercard and Visa) option.

| fare_media_id | fare_media_name | fare_media_type |
|---------------|-----------------|-----------------|
| tap_to_ride   | Tap to Ride   | 3  |

The single ride fare product shown below has both `cash` and `tap-to-ride` fare media options. When the single ride is paid for with the `tap-to-ride` fare media, it is one USD dollar cheaper.

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name  | fare_media_id | amount | currency |
|---------------|------------------|---------------|--------|----------|
| single-ride | Single Ride | tap_to_ride       | 6      | USD      |
| single-ride | Single Ride |       | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">Download the Clean Air Express feed</a></sup>
















