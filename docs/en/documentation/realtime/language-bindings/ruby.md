<a class="pencil-link" href="https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/ruby/README.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# Ruby GTFS-realtime Language Bindings

[![Gem Version](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

Provides Ruby classes generated from the [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) Protocol Buffer specification.  These classes will allow you to parse a binary Protocol Buffer GTFS-realtime data feed into Ruby objects.

!!! fail "Deprecated"

    *As of February 2019, the official `google-protobuf` Google protoc tool [doesn't support extensions](https://github.com/protocolbuffers/protobuf/issues/1198) in proto2 files.  A 3rd party tool, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), can be installed using `gem install ruby-protocol-buffers`, but doesn't seem to match the existing structure of the Ruby GTFS-rt bindings, as the unit tests fail.  As a result we are deprecating the Ruby bindings until official support for proto2 files is implemented in the Google protocol buffer tools.*

## Add the Dependency

To use the `gtfs-realtime-bindings` classes in your own project, you need to first install the [Ruby gem](https://rubygems.org/gems/gtfs-realtime-bindings):

```
gem install gtfs-realtime-bindings
```

## Example Code

The following code snippet demonstrates downloading a GTFS-realtime data feedf rom a particular URL, parsing it as a FeedMessage (the root type of theGTFS-realtime schema), and iterating over the results.

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

For more details on the naming conventions for the Ruby classes generated from the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), check out the [the gtfs-realtime.pb.rb source file](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb).
