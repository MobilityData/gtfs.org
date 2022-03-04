# Code Examples

GTFS-realtime data is encoded and decoded using Protocol Buffers, a compact binary representation designed for fast and efficient processing. How does one generate or parse this binary data? Read on for code samples to help you get started.

### Language Bindings
To work with GTFS realtime data, a developer would typically use the gtfs-realtime.proto schema to generate classes in the programming language of their choice. These classes can then be used for constructing GTFS realtime data model objects and serializing them as binary data or, in the reverse direction, parsing binary data into data model objects.

Because generating GTFS realtime data model classes from the gtfs-realtime.proto schema is such a common task, but also one that sometimes causes confusion for first-time developers, we provide pre-generated GTFS realtime language bindings for a number of the most popular programming languages through the open-source gtfs-realtime-bindings project.

Read on for language-specific details on parsing GTFS realtime data.

### Other Languages
We have tried to provide language bindings for all programming languages where (a) developers want to use GTFS realtime and (b) there is a mechanism for packaging code for easy re-use.

If you feel that your favorite language has been unjustly left off the list, you have two options:

Open an issue at the gtfs-realtime-bindings project page requesting that the language be added.
Generate your own Protocol Buffer bindings, possibly using a Third-Party Add On.

<hr>

## .NET
To use the `gtfs-realtime-bindings` .NET classes in your own project, you need to first install the module from the [NuGet repository](https://www.nuget.org/packages/GtfsRealtimeBindings/).

```
Install-Package GtfsRealtimeBindings
```

The following code snippet demonstrates downloading a GTFS realtime data feed from a particular URL, parsing it as a `FeedMessage` (the root type of the GTFS realtime schema), and iterating over the results.

```vb
using System.Net;
using ProtoBuf;
using transit_realtime;

WebRequest req = HttpWebRequest.Create("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
FeedMessage feed = Serializer.Deserialize<FeedMessage>(req.GetResponse().GetResponseStream());

foreach (FeedEntity entity in feed.entity) {
  ...
}
```

For more details, see the [.NET project page](https://github.com/google/gtfs-realtime-bindings/tree/master/dotnet).

<hr>

## Java

To use the `gtfs-realtime-bindings` Java classes in your own project, you need to add an appropriate dependency. We publish our module to the [Maven Central Repository](https://search.maven.org/) so that it can be easily referenced by Java build tools like Maven, Ivy, and Gradle.

In the dependency snippets below, replace version string `X.Y.Z` with the latest version available in the [Maven Central Repository](https://search.maven.org/#search%7Cga%7C1%7Ca%3A%22gtfs-realtime-bindings%22).

For [Maven](https://maven.apache.org/), add the following to your `pom.xml` dependencies section:

```xml
<dependency>
  <groupId>com.google.transit</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>X.Y.Z</version>
</dependency>
```

For [Gradle](https://www.gradle.org/), add the following to your `build.gradle` dependencies section:

```java
compile group: 'org.google.transit', name: 'gtfs-realtime-bindings', version: 'X.Y.Z'
```

The following code snippet demonstrates downloading a GTFS realtime data feed from a particular URL, parsing it as a `FeedMessage` (the root type of the GTFS realtime schema), and iterating over the results.

```java
import java.net.URL;

import com.google.transit.realtime.GtfsRealtime.FeedEntity;
import com.google.transit.realtime.GtfsRealtime.FeedMessage;

public class GtfsRealtimeExample {
  public static void main(String[] args) throws Exception {
    URL url = new URL("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
    FeedMessage feed = FeedMessage.parseFrom(url.openStream());
    for (FeedEntity entity : feed.getEntityList()) {
      if (entity.hasTripUpdate()) {
        System.out.println(entity.getTripUpdate());
      }
    }
  }
}
```

For more details, see the [Java project page](https://github.com/google/gtfs-realtime-bindings/tree/master/java).

<hr>

## JaveScript/Node.js

To use the `gtfs-realtime-bindings` JavaScript Node.js classes in your own project, you need to first install [our Node.js npm package](https://www.npmjs.com/package/gtfs-realtime-bindings):

```
npm install gtfs-realtime-bindings
```

These bindings are designed to be used in the [Node.js](https://nodejs.org/) environment, but with some effort, they can probably be used in other JavaScript environments as well.

The following Node.js code snippet demonstrates downloading a GTFS realtime data feed from a particular URL, parsing it as a `FeedMessage` (the root type of the GTFS realtime schema), and iterating over the results.

```javascript
var GtfsRealtimeBindings = require('gtfs-realtime-bindings');
var request = require('request');

var requestSettings = {
  method: 'GET',
  url: 'URL OF YOUR GTFS-REALTIME SOURCE GOES HERE',
  encoding: null
};
request(requestSettings, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    var feed = GtfsRealtimeBindings.transit_realtime.FeedMessage.decode(body);
    feed.entity.forEach(function(entity) {
      if (entity.trip_update) {
        console.log(entity.trip_update);
      }
    });
  }
});
```

For more details, see the [JavaScript / Node.js project page](https://github.com/google/gtfs-realtime-bindings/tree/master/nodejs).

<hr>

## PHP

To use the `gtfs-realtime-bindings` PHP classes in your own project, you need to first add a dependency for the [google/gtfs-realtime-bindings](https://packagist.org/packages/google/gtfs-realtime-bindings) package in your [Composer-based](https://getcomposer.org/) PHP project.

In the `require` section of your composer.json file, add the dependency:

```json
"require": {
  "google/gtfs-realtime-bindings": "x.y.z"
}
```

Where `x.y.z` is the latest release version of the [package](https://packagist.org/packages/google/gtfs-realtime-bindings).

The following code snippet demonstrates downloading a GTFS realtime data feed from a particular URL, parsing it as a `FeedMessage` (the root type of the GTFS realtime schema), and iterating over the results.

```php
require_once 'vendor/autoload.php';

use transit_realtime\FeedMessage;

$data = file_get_contents("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
$feed = new FeedMessage();
$feed->parse($data);
foreach ($feed->getEntityList() as $entity) {
  if ($entity->hasTripUpdate()) {
    error_log("trip: " . $entity->getId());
  }
}
```

For more details, see the [PHP project page](https://github.com/google/gtfs-realtime-bindings-php).

<hr>

## Python

To use the `gtfs-realtime-bindings` Python classes in your own project, you need to first install the module from the [PyPI repository](https://pypi.python.org/pypi/gtfs-realtime-bindings).

```python
# Using easy_install
easy_install --upgrade gtfs-realtime-bindings

# Using pip
pip install --upgrade gtfs-realtime-bindings
```

The following code snippet demonstrates downloading a GTFS-realtime data feed from a particular URL, parsing it as a `FeedMessage` (the root type of the GTFS-realtime schema), and iterating over the results.

```python
from google.transit import gtfs_realtime_pb2
import urllib

feed = gtfs_realtime_pb2.FeedMessage()
response = urllib.urlopen('URL OF YOUR GTFS-REALTIME SOURCE GOES HERE')
feed.ParseFromString(response.read())
for entity in feed.entity:
  if entity.HasField('trip_update'):
    print entity.trip_update
```

For more details, see the [Python project page](https://github.com/google/gtfs-realtime-bindings/tree/master/python).

<hr>

## Ruby

To use the `gtfs-realtime-bindings` classes in your own project, you need to first install [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings):

```
gem install gtfs-realtime-bindings
```

The following code snippet demonstrates downloading a GTFS realtime data feed from a particular URL, parsing it as a `FeedMessage` (the root type of the GTFS realtime schema), and iterating over the results.

```ruby
require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

data = Net::HTTP.get(URI.parse("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE"))
feed = Transit_realtime::FeedMessage.decode(data)
for entity in feed.entity do
  if entity.field?(:trip_update)
    p entity.trip_update
  end
end
```

For more details, see the [Ruby project page](https://github.com/google/gtfs-realtime-bindings/tree/master/ruby).