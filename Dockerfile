FROM postgres:latest

MAINTAINER Jarrod Parkes <parkesfjarrod@gmail.com>

COPY ./seed.sql /docker-entrypoint-initdb.d/seed.sql
