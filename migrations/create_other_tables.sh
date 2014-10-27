#!/bin/sh

dbname="mta"


psql $dbname << EOF
CREATE TABLE agency (
);

CREATE TABLE calendar (
);

CREATE TABLE calendar_dates (
);

CREATE TABLE frequencies (
);

CREATE TABLE shapes (
);

CREATE TABLE stop_times (
);

CREATE TABLE stops (
);

CREATE TABLE trips (
);
EOF
