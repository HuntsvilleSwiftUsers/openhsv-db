# OpenHSV (Postgres) Database

This repository contains a Docker image for the OpenHSV Postgres database. This image is an extension of Docker's official `postgres` image with start-up seed file for initializing the database (also called `postgres`) with dummy data.

## How to Use

```bash
# build container image and assign name
docker build -t openhsv-db:1.0.0 .

# run container (uses seed.sql to populate db)
OPENHSV_CID=$(docker run --name openhsv-db -d -e POSTGRES_PASSWORD=password openhsv-db:1.0.0)

# connect to openhsv-db container in psql shell (may need to wait a few seconds)
docker run -it --rm --link openhsv-db:postgres postgres psql -h postgres -U postgres

# test query
postgres=# SELECT * from categories;
```

Optionally, you could connect via the Bash shell...

```bash
# connect to openhsv-db container in bash shell
docker exec -it ${OPENHSV_CID} /bin/bash

# open of psql shell within openhsv-db container
psql -U postgres
```

## How to Debug

First, remove/comment the COPY command in the Dockerfile to inhibit the automatic import:

```
FROM postgres:latest

# (other commands)

# COPY ./seed.sql /docker-entrypoint-initdb.d/seed.sql
```

Then, take the following steps...

```bash
# build container image and assign name
docker build -t openhsv-db-debug:1.0.0 .

# mount local seed.sql file to the container's root directory
OPENHSV_DEBUG_CID=$(docker run --name openhsv-db-debug -d -v $(pwd)/seed.sql:/seed.sql -e POSTGRES_PASSWORD=password openhsv-db-debug:1.0.0)

# connect to openhsv-db-debug container in bash shell
docker exec -it ${OPENHSV_DEBUG_CID} /bin/bash

# attempt import of seed.sql file and look for errors
psql -U postgres -f seed.sql
```

Also, if you end up creating a bunch of containers you want to remove, then you can always run the following commands:

```bash
# stop and remove all containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```
