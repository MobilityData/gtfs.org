# GTFS SCHEDULE

## GTFS Schedule reference
curl https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/reference.md -o docs/schedule/reference.md

### replace header
new_header='# GTFS Schedule Reference'
sed -i.bak "1 s/.*/$new_header/" docs/schedule/reference.md

### patch links
sed -i.bak "s,../../CHANGES.md,../revision-history,g" docs/schedule/reference.md

## GTFS Schedule best practices
curl https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/best-practices.md -o docs/schedule/best-practices.md

### patch links
sed -i.bak "s,#dataset-publishing--general-practices,#dataset-publishing-general-practices,g" docs/schedule/best-practices.md
sed -i.bak "s,https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md,../reference,g" docs/schedule/best-practices.md

## GTFS Schedule examples

### GTFS Schedule example feed
curl https://raw.githubusercontent.com/google/transit/master/gtfs/spec/en/examples/README.md -o docs/schedule/example-feed.md

#### patch links
sed -i.bak "s,sample-feed-1.zip,https://github.com/google/transit/blob/master/gtfs/spec/en/examples/sample-feed-1.zip?raw=true,g" docs/schedule/example-feed.md
sed -i.bak "s,(sample-feed-1),(https://github.com/google/transit/tree/master/gtfs/spec/en/examples/sample-feed-1),g" docs/schedule/example-feed.md

## GTFS Schedule changes
rm docs/schedule/changes/*

curl https://raw.githubusercontent.com/google/transit/master/gtfs/CHANGES.md -o docs/schedule/changes/changes.md

### split changes file by heading level 3 (requires installation of gcsplit: https://christiantietze.de/posts/2019/12/markdown-split-by-chapter/)

new_header='# GTFS Schedule Changes'
sed -i.bak "1s/^/$new_header\n\n/" docs/schedule/changes/changes.md

### bump up headers
sed -i.bak 's/###/##/g' docs/schedule/changes/changes.md

### convert heading level 3 to bold
sed -i.bak '/^### */ s/$/&**<br>/' docs/schedule/changes/changes.md
sed -i.bak 's/### /**/g' docs/schedule/changes/changes.md
sed -i.bak 's/##/#/g' docs/schedule/changes/changes.md
find . -name "*.bak" -type f -delete

gcsplit --prefix='changes' --suffix-format='%02d.md' docs/schedule/changes/changes.md /^'# '/ "{*}"
rm -r docs/schedule/changes/changes.md
rm -r changes00.md

mv changes* docs/schedule/changes

### rename split changes files
strings=(
    index
    process
    guiding-principles
    revision-history
)
files=(docs/schedule/changes/*)
let "count=0"
for newname in "${strings[@]}"; do
    mv "${files[$count]}" "docs/schedule/changes/$newname.md"
    let "count++" 
done

mv docs/schedule/changes/process.md docs/schedule/changes/guiding-principles.md docs/schedule/changes/revision-history.md docs/schedule

echo "<br><div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div>
" >> docs/schedule/changes/index.md

#### patch links
sed -i.bak "s,../CONTRIBUTING.md,https://github.com/google/transit/blob/master/CONTRIBUTING.md,g" docs/schedule/process.md

# GTFS REALTIME

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

## GTFS Realtime feed entities

### Feed Entities
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/feed-entities.md -o docs/realtime/feed-entities/index.md
new_header='# Feed Entities'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/index.md

### Trip Updates
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/trip-updates.md -o docs/realtime/feed-entities/trip-updates.md
new_header='# Trip Updates'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/trip-updates.md

### Service Alerts
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/service-alerts.md -o docs/realtime/feed-entities/service-alerts.md
new_header='# Service Alerts'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/service-alerts.md

### Vehicle Positions
curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/vehicle-positions.md -o docs/realtime/feed-entities/vehicle-positions.md
new_header='# Vehicle Positions'
sed -i.bak "1s/^/$new_header\n\n/" docs/realtime/feed-entities/vehicle-positions.md

## GTFS Realtime Feed Examples

curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/examples/alerts.asciipb -o docs/realtime/feed-examples/service-alerts.md
ALERTS=docs/realtime/feed-examples/service-alerts.md

echo "# Service alert

The following example is an ASCII representation of an Alert feed.

\`\`\`python
`cat $ALERTS`
\`\`\`

" > docs/realtime/feed-examples/service-alerts.md

curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/spec/en/examples/trip-updates-full.asciipb -o docs/realtime/feed-examples/trip-updates.md
UPDATES=docs/realtime/feed-examples/trip-updates.md

echo "# Trip Update

The following example is an ASCII representation of an full-dataset Trip Update feed.

\`\`\`python
`cat $UPDATES`
\`\`\`

" > docs/realtime/feed-examples/trip-updates.md

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

# ALL FILES

## convert http to https
grep -rl 'http:' docs | xargs sed -i.bak 's/http:/https:/g'

sed -i.bak "s,https,http,g" docs/assets/*.svg
sed -i.bak "s,includes https://,includes http://,g" docs/schedule/reference.md
sed -i.bak "s,includes https://,includes http://,g" docs/realtime/reference.md
sed -i.bak "s,includes https://,includes http://,g" docs/realtime/gtfs-realtime.proto
sed -i.bak "s,includes https://,includes http://,g" docs/realtime/proto.md

# remove all temporary .bak files
find . -name "*.bak" -type f -delete



# ##TO DO

# ## GTFS Realtime changes

# ## Resources TOC

# # curl https://raw.githubusercontent.com/google/transit/master/gtfs-realtime/CHANGES.md 
