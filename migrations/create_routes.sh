#!/bin/sh
# migration one
# done

dbname="mta"

psql $dbname << EOF
CREATE TABLE routes (
    route_id integer NOT NULL,
    agency_id integer,
    route_short_name varchar(50),
    route_long_name varchar(100),
    route_desc text,
    route_type integer,
    route_url varchar(100),
    route_color varchar(6),
    route_text_color varchar(6)
);
EOF