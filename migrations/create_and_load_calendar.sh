#!/bin/sh
# migration four
#done

# service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date

dbname="mta"

cd ..

psql $dbname << EOF
CREATE TABLE calendar (
	service_id integer NOT NULL,
	monday boolean NOT NULL,
	tuesday boolean NOT NULL,
	wednesday boolean NOT NULL,
	thursday boolean NOT NULL,
	friday boolean NOT NULL,
	saturday boolean NOT NULL,
	sunday boolean NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL
);

COPY calendar FROM '${PWD}/calendar.txt' WITH CSV HEADER;

EOF
