#!/bin/sh
#migration five
#done

dbname="mta"

cd ..

psql $dbname << EOF
CREATE TABLE calendar_dates (
	service_id integer NOT NULL,
	date date NOT NULL,
	exception_type integer NOT NULL
);

COPY calendar_dates FROM '${PWD}/calendar_dates.txt' WITH CSV HEADER;

EOF
