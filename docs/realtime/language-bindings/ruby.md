<a href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/ruby/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.71 7.04c.39-.39.39-1.04 0-1.41l-2.34-2.34c-.37-.39-1.02-.39-1.41 0l-1.84 1.83 3.75 3.75M3 17.25V21h3.75L17.81 9.93l-3.75-3.75L3 17.25Z"></path></svg>
  </a>
  
# Ruby GTFS-realtime Language Bindings

[![Gem Version](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

Provides Ruby classes generated from the
[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol
Buffer specification.  These classes will allow you to parse a binary Protocol
Buffer GTFS-realtime data feed into Ruby objects.

!!! fail "Deprecated"

    *As of February 2019, the official `google-protobuf` Google protoc tool [doesn't support extensions](https://github.com/protocolbuffers/protobuf/issues/1198) in proto2 files.  A 3rd party tool, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), can be installed using `gem install ruby-protocol-buffers`, but doesn't seem to match the existing structure of the Ruby GTFS-rt bindings, as the unit tests fail.  As a result we are deprecating the Ruby bindings until official support for proto2 files is implemented in the Google protocol buffer tools.*

## Add the Dependency

To use the `gtfs-realtime-bindings` classes in your own project, you need to
first install the [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings):

```
gem install gtfs-realtime-bindings
```

## Example Code

The following code snippet demonstrates downloading a GTFS-realtime data feed
from a particular URL, parsing it as a FeedMessage (the root type of the
GTFS-realtime schema), and iterating over the results.

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

For more details on the naming conventions for the Ruby classes generated from
the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto),
check out the [the gtfs-realtime.pb.rb source file](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb).
