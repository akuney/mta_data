#!/bin/sh
#migration six
#done

dbname="mta"


cd ..

psql $dbname << EOF

BEGIN;

CREATE TABLE shapes (
	shape_id integer NOT NULL,
	shape_pt_lat numeric(8,6) NOT NULL,
	shape_pt_lon numeric(8,6) NOT NULL,
	shape_pt_sequence integer NOT NULL,
	shape_dist_traveled numeric
);

COPY shapes FROM '${PWD}/shapes.txt' WITH CSV HEADER;

CREATE TABLE stop_times (
	trip_id integer NOT NULL,
	arrival_time varchar(50) NOT NULL,
	departure_time varchar(50) NOT NULL,
	stop_id integer NOT NULL,
	stop_sequence integer NOT NULL,
	pickup_type integer,
	drop_off_type integer
);

COPY stop_times FROM '${PWD}/stop_times.txt' WITH CSV HEADER;

CREATE TABLE stops (
	stop_id serial,
	stop_code varchar(50),
	stop_name varchar(50) NOT NULL,
	stop_desc TEXT,
	stop_lat numeric(8,6) NOT NULL,
	stop_lon numeric(8,6) NOT NULL,
	zone_id integer,
	stop_url varchar(100),
	location_type integer,
	parent_station integer,
	wheelchair_accessible integer
);

COPY stops FROM '${PWD}/stops.txt' WITH CSV HEADER;


CREATE TABLE trips (
	route_id integer NOT NULL,
	service_id integer NOT NULL,
	trip_id serial,
	trip_headsign varchar(50),
	trip_short_name varchar(50),
	direction_id integer,
	block_id integer,
	shape_id integer,
	wheelchair_accessible boolean
);

COPY trips FROM '${PWD}/trips.txt' WITH CSV HEADER;

commit;

EOF
