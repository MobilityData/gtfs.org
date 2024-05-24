# GTFS SCHEDULE

# ---------------------------------------------------------------------------------

## GTFS Schedule reference (schedule/reference) 
curl https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/reference.md -o docs/schedule/reference.md

### replace header
new_header='# GTFS Schedule Reference'
sed -i.bak "1 s/.*/$new_header/" docs/schedule/reference.md

### patch links
sed -i.bak "s,../../CHANGES.md,../revision-history,g" docs/schedule/reference.md
sed -i.bak 's,examples/2-leg.svg,../assets/2-leg.svg,g' docs/schedule/reference.md
sed -i.bak 's,examples/3-leg.svg,../assets/3-leg.svg,g' docs/schedule/reference.md

# ---------------------------------------------------------------------------------

## GTFS Schedule best practices (schedule/best-practices)
curl https://raw.githubusercontent.com/google/transit/master/gtfs/best-practices/best-practices.md -o docs/schedule/best-practices.md

### patch links
sed -i.bak "s,#dataset-publishing--general-practices,#dataset-publishing-general-practices,g" docs/schedule/best-practices.md
sed -i.bak "s,https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md,../reference,g" docs/schedule/best-practices.md

# ---------------------------------------------------------------------------------

## GTFS Schedule examples 

### GTFS Schedule example feed (schedule/example-feed)
curl https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/examples/README.md -o docs/schedule/example-feed.md

#### patch links
sed -i.bak "s,sample-feed-1.zip,https://github.com/google/transit/blob/master/gtfs/spec/en/examples/sample-feed-1.zip?raw=true,g" docs/schedule/example-feed.md
sed -i.bak "s,(sample-feed-1),(https://github.com/google/transit/tree/master/gtfs/spec/en/examples/sample-feed-1),g" docs/schedule/example-feed.md

# ---------------------------------------------------------------------------------

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

# ---------------------------------------------------------------------------------

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

### patch assets links
sed -i.bak "s,(images/,(../../assets/,g" docs/realtime/reference.md

# ---------------------------------------------------------------------------------

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

# ---------------------------------------------------------------------------------

## GTFS Realtime best practices
rm docs/realtime/best-practices.md
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/best-practices/best-practices.md -o docs/realtime/best-practices.md

### replace header
new_header='# GTFS Realtime Best Practices'
sed -i.bak "1s/.*/$new_header/" docs/realtime/best-practices.md

### patch links
sed -i.bak "s,#practice-recommendations-organized-by-case,#practice-recommendations-organized-by-use-case,g" docs/realtime/best-practices.md
sed -i.bak "s,https://gtfs.org/reference/realtime/v2/,../reference,g" docs/realtime/best-practices.md

# ---------------------------------------------------------------------------------

## GTFS Realtime feed entities

### Feed Entities
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/feed-entities.md -o docs/realtime/feed-entities/index.md
new_header='# Feed Entities'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/index.md

### Trip Updates
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/trip-updates.md -o docs/realtime/feed-entities/trip-updates.md
new_header='# Trip Updates'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/trip-updates.md
sed -i.bak "s,https://developers.google.com/transit/gtfs/,../../schedule/reference.md,g" docs/realtime/feed-entities/trip-updates.md
sed -i.bak "s,https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#tripstxt,../../schedule/reference.md#tripstxt,g" docs/realtime/feed-entities/trip-updates.md
sed -i.bak "s,reference.md#message-stoptimeupdate,../reference.md#message-stoptimeupdate,g" docs/realtime/feed-entities/trip-updates.md
sed -i.bak "s,reference.md#message-stoptimeevent,../reference.md#message-stoptimeevent,g" docs/realtime/feed-entities/trip-updates.md
sed -i.bak "s,/gtfs-realtime/spec/en/reference.md/#enum-schedulerelationship,../reference.md#enum-schedulerelationship,g" docs/realtime/feed-entities/trip-updates.md

### Service Alerts
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/service-alerts.md -o docs/realtime/feed-entities/service-alerts.md
new_header='# Service Alerts'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/service-alerts.md

### Vehicle Positions
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/vehicle-positions.md -o docs/realtime/feed-entities/vehicle-positions.md
new_header='# Vehicle Positions'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/vehicle-positions.md
sed -i.bak "s,reference.md#message-tripdescriptor,../reference.md#message-tripdescriptor,g" docs/realtime/feed-entities/vehicle-positions.md
sed -i.bak "s,reference.md#message-vehicledescriptor,../reference.md#message-vehicledescriptor,g" docs/realtime/feed-entities/vehicle-positions.md

### Trip Modifications
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/trip-modifications.md -o docs/realtime/feed-entities/trip-modifications.md
new_header='# Trip Modifications'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/trip-modifications.md
sed -i.bak "s,https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#stop_timestxt,../schedule/reference/#stop_timestxt,g" docs/realtime/feed-entities/trip-modifications.md
sed -i.bak 's,images/trip_modification.png,../../assets/trip_modification.png,g' docs/realtime/feed-entities/trip-modifications.md
sed -i.bak 's,images/propagated_delay.png,../../assets/propagated_delay.png,g' docs/realtime/feed-entities/trip-modifications.md
sed -i.bak 's,images/first_stop_reference.png,../../assets/first_stop_reference.png,g' docs/realtime/feed-entities/trip-modifications.md

### service alerts
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/examples/alerts.asciipb -o docs/realtime/feed-examples/service-alerts.md
ALERTS=docs/realtime/feed-examples/service-alerts.md

echo "# Service alert

The following example is an ASCII representation of an Alert feed.

\`\`\`python
`cat $ALERTS`
\`\`\`

" > docs/realtime/feed-examples/service-alerts.md

### trip updates
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/examples/trip-updates-full.asciipb -o docs/realtime/feed-examples/trip-updates.md
UPDATES=docs/realtime/feed-examples/trip-updates.md

echo "# Trip Update

The following example is an ASCII representation of an full-dataset Trip Update feed.

\`\`\`python
`cat $UPDATES`
\`\`\`

" > docs/realtime/feed-examples/trip-updates.md

# ---------------------------------------------------------------------------------

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

### dotnet
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/dotnet/README.md -o docs/realtime/language-bindings/dotnet.md

### java
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/java/README.md -o docs/realtime/language-bindings/java.md

### nodejs
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/nodejs/README.md -o docs/realtime/language-bindings/nodejs.md

### python
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/python/README.md -o docs/realtime/language-bindings/python.md

### golang
curl https://raw.githubusercontent.com/MobilityData/gtfs-realtime-bindings/master/golang/README.md -o docs/realtime/language-bindings/golang.md

# ---------------------------------------------------------------------------------

# AWESOME-TRANSIT RESOURCE LIST
cd docs/resources
rm agency-tools.md apps.md community.md data.md getting-started.md gtfs-realtime.md gtfs.md hardware.md multimodal.md other.md sdk.md siri.md software-for-creating-apis.md visualizations.md
cd ../..
curl https://raw.githubusercontent.com/CUTR-at-USF/awesome-transit/master/README.md -o docs/resources/awesome.md

## split awesome by heading level 2 (MacOS requires installation and substitution of gcsplit: https://christiantietze.de/posts/2019/12/markdown-split-by-chapter/)
if [[ "$OSTYPE" == "darwin"* ]]; then
    gcsplit --prefix='awesome' --suffix-format='%02d.md' docs/resources/awesome.md /^'## '/ "{*}"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    csplit --prefix='awesome' --suffix-format='%02d.md' docs/resources/awesome.md /^'## '/ "{*}"
fi

mv awesome* docs/resources
rm -r docs/resources/awesome.md

## split resources by heading level 3 (MacOS requires installtion and substitution of gcsplit: https://christiantietze.de/posts/2019/12/markdown-split-by-chapter/)
if [[ "$OSTYPE" == "darwin"* ]]; then
    gcsplit --prefix='resources' --suffix-format='%02d.md' docs/resources/awesome00.md /^'### '/ "{*}"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    csplit --prefix='resources' --suffix-format='%02d.md' docs/resources/awesome00.md /^'### '/ "{*}"
fi

mv resources* docs/resources
rm -r docs/resources/awesome00.md

## bump up headers
sed -i.bak 's/##/#/g' docs/resources/awesome*
sed -i.bak 's/###/#/g' docs/resources/resources*

## remove all temporary .bak files
find . -name "*.bak" -type f -delete

cd docs/resources
rm awesome01.md awesome02.md resources00.md resources01.md
cd ../..

### replace header
new_header='# Other Resources'
sed -i.bak "1 s/.*/$new_header/" docs/resources/resources15.md

# ---------------------------------------------------------------------------------

# rename split resources files
strings=(
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
FILES=($(find docs/resources -type f -name "resources*" | sort))
let "count=0"
for newname in "${strings[@]}"; do
    echo "Rename file: ${FILES[${count}]} to $newname"
    mv "${FILES[$count]}" "docs/resources/$newname.md"
    let "count++" 
done

# ALL FILES

## remove all temporary .bak files
find . -name "*.bak" -type f -delete