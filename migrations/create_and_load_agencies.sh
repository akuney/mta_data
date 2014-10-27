#!/bin/sh
#migration three
#done

dbname="mta"

cd ..

psql $dbname << EOF
CREATE TABLE agency (
	agency_id serial,
	agency_name varchar(50) NOT NULL,
	agency_url text,
	agency_timezone varchar(50),
	agency_phone varchar(50),
	agency_lang varchar(50)
);

COPY agency FROM '${PWD}/agency.txt' WITH CSV HEADER;

EOF
