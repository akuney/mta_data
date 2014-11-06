#!/bin/sh
#2:04 p.m. 11/6

dbname="mta"

psql $dbname << EOF
BEGIN;

CREATE OR REPLACE VIEW agency_view AS
SELECT agency_id, agency_name
FROM agency;

CREATE OR REPLACE VIEW routes_view AS
SELECT route_id, agency_id, route_long_name, route_type
FROM routes;

CREATE OR REPLACE VIEW stop_times_view AS
SELECT trip_id, departure_time, stop_id, stop_sequence, pickup_type
FROM stop_times;

CREATE OR REPLACE VIEW stops_view AS
SELECT stop_id, stop_name, stop_lat, stop_lon
FROM stops;

CREATE OR REPLACE VIEW trips_view AS
SELECT route_id, service_id, trip_id, trip_headsign, trip_short_name, direction_id, shape_id
FROM trips;

COMMIT;
EOF