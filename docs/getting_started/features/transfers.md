# Transfers

Transfers provide details about transitions between different travel segments (or legs), enabling trip planners to determine the feasibility of journeys that include transfers. Specifying transfers does not imply passengers can't transfer elsewhere, it just shows whether certain transfers are not possible or require a minimum time to transfer.

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[transfers.txt](/documentation/schedule/reference/#transferstxt)|`from_stop_id`, `to_stop_id`, `from_route_id`, `to_route_id`, `from_trip_id`, `to_trip_id`, `transfer_type`, `min_transfer_time` |

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows three different transfers: one between stops that requires a minimum transfer time of 5 minutes, one timed transfer point between two routes, and one in-seat transfer between two trips made by the same vehicle.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#transferstxt"><b>transfers.txt</b></a> <br>
        </p>

        | from_stop_id | to_stop_id | from_route_id | to_route_id | from_trip_id | to_trip_id | transfer_type | min_transfer_time |
        |--------------|------------|---------------|-------------|--------------|------------|---------------|-------------------|
        | s6           | s7         |               |             |              |            |             2 |               300 |
        |              |            |               |             | PL04-003     | DL57-008   |             4 |                   |
        |              |            | BR09          | CR01        | BR09-012     | CR01-005   |             1 |                   |
