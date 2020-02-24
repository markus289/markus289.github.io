---
layout: default
title: Open Street Map
---

## {{ page.title }}

Importing the `planet` into PostgreSQL.

    osm2pgsql -c -s -S /usr/share/osm2pgsql/default.style -C 32000 -d gis -U gisuser -W --flat-nodes ~/tmp/osm2pgsql_flat_nodes --number-processes 12 planet-YYMMDD.osm.bz2
