#!/bin/sh

influxd & sleep 3

influx -execute "CREATE DATABASE IF NOT EXISTS telegraf"
influx -execute "CREATE USER root WITH PASSWORD 'toor'"
influx -execute "GRANT ALL ON telegraf TO root"

kill -9 $(ps | grep influxd | head -n 1 | awk '{print $1}')
#pkill influxd

influxd
