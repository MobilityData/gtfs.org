# GTFS Schedule

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

# GTFS Realtime

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

# All files

## convert http to https
grep -rl 'http:' docs | xargs sed -i.bak 's/http:/https:/g'

sed -i.bak "s,https,http,g" docs/assets/*.svg
sed -i.bak "s,includes https://,includes http://,g" docs/schedule/reference.md
sed -i.bak "s,includes https://,includes http://,g" docs/realtime/reference.md
sed -i.bak "s,includes https://,includes http://,g" docs/realtime/gtfs-realtime.proto
sed -i.bak "s,includes https://,includes http://,g" docs/realtime/proto.md

# remove all temporary .bak files
find . -name "*.bak" -type f -delete
