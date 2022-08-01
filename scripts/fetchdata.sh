# GTFS SCHEDULE

## GTFS Schedule reference (schedule/reference) 
curl https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/reference.md -o docs/schedule/reference.md

### replace header
new_header='# GTFS Schedule Reference'
sed -i.bak "1 s/.*/$new_header/" docs/schedule/reference.md

### patch links
sed -i.bak "s,../../CHANGES.md,../revision-history,g" docs/schedule/reference.md
sed -i.bak 's,examples/2-leg.svg,../assets/2-leg.svg,g' docs/schedule/reference.md
sed -i.bak 's,examples/3-leg.svg,../assets/3-leg.svg,g' docs/schedule/reference.md

### edit this page button
PAGE=docs/schedule/reference.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs/spec/en/reference.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

## GTFS Schedule best practices (schedule/best-practices)
curl https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/best-practices.md -o docs/schedule/best-practices.md

### patch links
sed -i.bak "s,#dataset-publishing--general-practices,#dataset-publishing-general-practices,g" docs/schedule/best-practices.md
sed -i.bak "s,https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md,../reference,g" docs/schedule/best-practices.md

### edit this page button
PAGE=docs/schedule/best-practices.md
echo "<a class=\"pencil-link\" href=\"https://github.com/MobilityData/GTFS_Schedule_Best-Practices/edit/master/en/best-practices.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE



## GTFS Schedule examples 

### GTFS Schedule example feed (schedule/example-feed)
curl https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/examples/README.md -o docs/schedule/example-feed.md

#### patch links
sed -i.bak "s,sample-feed-1.zip,https://github.com/google/transit/blob/master/gtfs/spec/en/examples/sample-feed-1.zip?raw=true,g" docs/schedule/example-feed.md
sed -i.bak "s,(sample-feed-1),(https://github.com/google/transit/tree/master/gtfs/spec/en/examples/sample-feed-1),g" docs/schedule/example-feed.md

#### edit this page
PAGE=docs/schedule/example-feed.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs/spec/en/examples/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

### GTFS Schedule data examples (schedule/data-examples)
curl https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/examples/data-examples.md -o docs/schedule/data-examples.md
sed -i.bak "s,../reference.md#routestxt,../reference/#routestxt,g" docs/schedule/data-examples.md
sed -i.bak "s,victor-valley-transit.svg,../assets/victor-valley-transit.svg,g" docs/schedule/data-examples.md
sed -i.bak "s,../reference.md#stopstxt,../reference/#stopstxt,g" docs/schedule/data-examples.md
sed -i.bak "s,../reference.md#stoptimestxt,../reference/#stop_timestxt,g" docs/schedule/data-examples.md
sed -i.bak "s,../reference.md#stop_timestxt,../reference/#stop_timestxt,g" docs/schedule/data-examples.md

#### edit this page
PAGE=docs/schedule/data-examples.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs/spec/en/examples/data-examples.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

# GTFS REALTIME

## GTFS Realtime overview (realtime/)
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/README.md -o docs/realtime/index.md

### add intro
INTRO=docs/realtime/index.md
echo "# GTFS Realtime Overview

<div class="landing-page">
    <a class="button" href="reference">Reference</a><a class="button" href="best-practices">Best Practices</a><a class="button" href="feed-examples">Examples</a><a class="button" href="changes">Changes</a>
</div>

## Getting Started

Providing users transit data updates in real time greatly enhances their experience of your transit services. Providing up-to-date information about current arrival and departure times allows users to smoothly plan their trips. As a result, in case of an unfortunate delay, a rider would be relieved to know that they can stay home a little bit longer.

`cat $INTRO`" > docs/realtime/index.md

### patch links
sed -i.bak "s,https://developers.google.com/transit/gtfs/reference,../schedule/reference,g" docs/realtime/index.md
sed -i.bak "s,feed-entities.md,feed-entities,g" docs/realtime/index.md
sed -i.bak "s,examples/,feed-examples,g" docs/realtime/index.md
sed -i.bak "s,reference.md,reference,g" docs/realtime/index.md
sed -i.bak "s,Publish your feed,[Publish your feed](best-practices/#feed-publishing-general-practices),g" docs/realtime/index.md
sed -i.bak "s,../../proto/gtfs-realtime.proto,proto,g" docs/realtime/index.md

### edit this page button
PAGE=docs/realtime/index.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

## GTFS Realtime reference
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/reference.md -o docs/realtime/reference.md

### replace header
new_header='# GTFS Realtime Reference'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/reference.md

### replace strings
sed -i.bak "s,# Elements,## Elements,g" docs/realtime/reference.md
sed -i.bak "s,#### Fields,**Fields**,g" docs/realtime/reference.md
sed -i.bak "s,#### Values,**Values**,g ; s,#### _Values_,**Values**,g" docs/realtime/reference.md

### patch links
sed -i.bak "s,trip-updates.md,/realtime/trip-updates,g" docs/realtime/reference.md
sed -i.bak "s,https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#tripstxt,/schedule/reference/#tripstxt,g" docs/realtime/reference.md
sed -i.bak "s,/gtfs-realtime/spec/en/examples/migration-duplicated.md,https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/examples/migration-duplicated.md,g" docs/realtime/reference.md

### edit this page button
PAGE=docs/realtime/reference.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/reference.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE


## GTFS Realtime proto
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/proto/gtfs-realtime.proto -o docs/realtime/gtfs-realtime.proto

PROTO=docs/realtime/gtfs-realtime.proto

echo "# GTFS Realtime Protobuf
Download the [gtfs-realtime.proto](gtfs-realtime.proto) file and use it to compile your GTFS-realtime feed. The contents of the file are shown inline below.
For more information about using protobufs, see the [Protocol Buffers Developer Guide](https://developers.google.com/protocol-buffers/docs/overview).
\`\`\`protobuf
`cat $PROTO`
\`\`\`
" > docs/realtime/proto.md

### edit this page button
PAGE=docs/realtime/proto.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/proto/gtfs-realtime.proto\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

## GTFS Realtime best practices
rm docs/realtime/best-practices.md
rm -rf repos
git clone https://github.com/MobilityData/GTFS_Realtime_Best-Practices repos/gtfs-realtime-best-practices
BEST_PRACTICE_FILES=(introduction FeedHeader FeedEntity TripUpdate TripDescriptor VehicleDescriptor StopTimeUpdate StopTimeEvent VehiclePosition Position Alert Frequency-based about)

for i in "${BEST_PRACTICE_FILES[@]}"
do
    (cat repos/gtfs-realtime-best-practices/en/$i.md ; echo) >> docs/realtime/best-practices.md
done

rm -rf repos

### replace header
new_header='# GTFS Realtime Best Practices'
sed -i.bak "1s/.*/$new_header/" docs/realtime/best-practices.md

### patch links
sed -i.bak "s,#practice-recommendations-organized-by-case,#practice-recommendations-organized-by-use-case,g" docs/realtime/best-practices.md
sed -i.bak "s,https://gtfs.org/reference/realtime/v2/,../reference,g" docs/realtime/best-practices.md

### edit this page button
PAGE=docs/realtime/best-practices.md
echo "<a class=\"pencil-link\" href=\"https://github.com/MobilityData/GTFS_Realtime_Best-Practices/tree/master/en\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

## GTFS Realtime feed entities

### Feed Entities
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/feed-entities.md -o docs/realtime/feed-entities/index.md
new_header='# Feed Entities'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/index.md

#### edit this page button
PAGE=docs/realtime/feed-entities/index.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/feed-entities.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

### Trip Updates
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/trip-updates.md -o docs/realtime/feed-entities/trip-updates.md
new_header='# Trip Updates'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/trip-updates.md

#### edit this page button
PAGE=docs/realtime/feed-entities/trip-updates.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/trip-updates.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

### Service Alerts
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/service-alerts.md -o docs/realtime/feed-entities/service-alerts.md
new_header='# Service Alerts'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/service-alerts.md

#### edit this page button
PAGE=docs/realtime/feed-entities/service-alerts.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/service-alerts.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

### Vehicle Positions
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/vehicle-positions.md -o docs/realtime/feed-entities/vehicle-positions.md
new_header='# Vehicle Positions'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/vehicle-positions.md

#### edit this page button
PAGE=docs/realtime/feed-entities/vehicle-positions.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/vehicle-positions.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

## GTFS Realtime Feed Examples

### service alerts
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/examples/alerts.asciipb -o docs/realtime/feed-examples/service-alerts.md
ALERTS=docs/realtime/feed-examples/service-alerts.md

echo "# Service alert

The following example is an ASCII representation of an Alert feed.

\`\`\`python
`cat $ALERTS`
\`\`\`

" > docs/realtime/feed-examples/service-alerts.md

#### edit this page button
PAGE=docs/realtime/feed-examples/service-alerts.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/examples/alerts.asciipb\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

### trip updates
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/examples/trip-updates-full.asciipb -o docs/realtime/feed-examples/trip-updates.md
UPDATES=docs/realtime/feed-examples/trip-updates.md

echo "# Trip Update

The following example is an ASCII representation of an full-dataset Trip Update feed.

\`\`\`python
`cat $UPDATES`
\`\`\`

" > docs/realtime/feed-examples/trip-updates.md

#### edit this page button
PAGE=docs/realtime/feed-examples/trip-updates.md
echo "<a class=\"pencil-link\" href=\"https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/examples/trip-updates-full.asciipb\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

## GTFS Realtime Language Bindings
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/README.md -o docs/realtime/language-bindings/index.md
sed -i.bak 's,dotnet/README.md,dotnet.md,g' docs/realtime/language-bindings/index.md
sed -i.bak 's,java/README.md,java.md,g' docs/realtime/language-bindings/index.md
sed -i.bak 's,nodejs/README.md,nodejs.md,g' docs/realtime/language-bindings/index.md
sed -i.bak 's,python/README.md,python.md,g' docs/realtime/language-bindings/index.md
sed -i.bak 's,golang/README.md,golang.md,g' docs/realtime/language-bindings/index.md
sed -i.bak 's,ruby/README.md,ruby.md,g' docs/realtime/language-bindings/index.md
sed -i.bak 's,https://github.com/google/gtfs-realtime-bindings-php,php.md,g' docs/realtime/language-bindings/index.md
sed -i.bak 's,(CONTRIBUTING.md),(https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md),g' docs/realtime/language-bindings/index.md

#### edit this page button
PAGE=docs/realtime/language-bindings/index.md
echo "<a class=\"pencil-link\" href=\"https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE


### dotnet
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/dotnet/README.md -o docs/realtime/language-bindings/dotnet.md

#### edit this page button
PAGE=docs/realtime/language-bindings/dotnet.md
echo "<a class=\"pencil-link\" href=\"https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/dotnet/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE


### java
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/java/README.md -o docs/realtime/language-bindings/java.md

#### edit this page button
PAGE=docs/realtime/language-bindings/java.md
echo "<a class=\"pencil-link\" href=\"https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/java/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

### nodejs
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/nodejs/README.md -o docs/realtime/language-bindings/nodejs.md

#### edit this page button
PAGE=docs/realtime/language-bindings/nodejs.md
echo "<a class=\"pencil-link\" href=\"https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/nodejs/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

### python
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/python/README.md -o docs/realtime/language-bindings/python.md

#### edit this page button
PAGE=docs/realtime/language-bindings/python.md
echo "<a class=\"pencil-link\" href=\"https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/python/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE

### golang
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/golang/README.md -o docs/realtime/language-bindings/golang.md

#### edit this page button
PAGE=docs/realtime/language-bindings/golang.md
echo "<a class=\"pencil-link\" href=\"https://github.com/MobilityData/gtfs-realtime-bindings/edit/master/golang/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE


# AWESOME-TRANSIT RESOURCE LIST
rm docs/resources/*
curl https://raw.githubusercontent.com/CUTR-at-USF/awesome-transit/master/README.md -o docs/resources/awesome.md

## remove toc
# sed -i.bak -e '9,39d' docs/resources/awesome.md

## split awesome by heading level 2 (requires installation of gcsplit: https://christiantietze.de/posts/2019/12/markdown-split-by-chapter/)
gcsplit --prefix='awesome' --suffix-format='%02d.md' docs/resources/awesome.md /^'## '/ "{*}"
mv awesome* docs/resources
rm -r docs/resources/awesome.md

## split resources by heading level 3 (requires installtion of gcsplit: https://christiantietze.de/posts/2019/12/markdown-split-by-chapter/)
gcsplit --prefix='resources' --suffix-format='%02d.md' docs/resources/awesome00.md /^'### '/ "{*}"
mv resources* docs/resources
rm -r docs/resources/awesome00.md

## bump up headers
sed -i.bak 's/##/#/g' docs/resources/awesome*
sed -i.bak 's/###/#/g' docs/resources/resources*

## remove all temporary .bak files
find . -name "*.bak" -type f -delete

## rename split resources files
strings=(
    license
    about
    temp
    toc
    getting-started
    community
    data
    software-for-creating-apis
    agency-tools
    hardware
    apps
    sdk
    visualizations
    gtfs
    gtfs-realtime
    siri
    multimodal
    other
)
files=(docs/resources/*)
let "count=0"
for newname in "${strings[@]}"; do
    mv "${files[$count]}" "docs/resources/$newname.md"
    let "count++" 
done

## replace headers
new_header='# Resources'
sed -i.bak "1 s/.*/$new_header/" docs/resources/temp.md
new_header='# Other Resources'
sed -i.bak "1 s/.*/$new_header/" docs/resources/other.md

sed -i.bak 's/# Table of Contents/## Table of Contents/g' docs/resources/toc.md
sed -i.bak 's/# About/## About/g' docs/resources/about.md
sed -i.bak 's/# License/## License/g' docs/resources/license.md

cat docs/resources/temp.md docs/resources/toc.md docs/resources/about.md docs/resources/license.md > docs/resources/index.md

rm -r docs/resources/temp.md docs/resources/toc.md docs/resources/license.md docs/resources/about.md

## edit this page buttons
for file in docs/resources/*; do
    PAGE=$file
    echo "<a class=\"pencil-link\" href=\"https://github.com/CUTR-at-USF/awesome-transit/edit/master/README.md\" title=\"Edit this page\" target=\"_blank\">
    <svg class=\"pencil\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 24 24\"><path d=\"M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z\"></path></svg>
  </a>
  
`cat $PAGE`" > $PAGE
done

# ALL FILES

## remove all temporary .bak files
find . -name "*.bak" -type f -delete