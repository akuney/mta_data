#!/bin/sh
# migration two
# done

dbname="mta"

cd ..

psql $dbname << EOF
COPY routes FROM '${PWD}/routes.txt' WITH CSV HEADER;
EOF