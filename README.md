# Redis Sample

Master in Computer Science - University of Toulon 2018

## Redis Database.

_Redis_ is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker. This database can use a multitude of data structure (strings, hashes, lists, sets, bitmaps, hyperloglogs, geospatial, ...). Its is part of a `key-value` database.

The handling of this tool is very simple!

```terminal
# Save & Retrieve a value
redis> APPEND superkey "Super Value"
redis> GET superkey
"Super Value"
```

_Redis_ includes a lot of operators to manage the database on different categories:

- Strings

  - `APPEND key value` Append a value to a key
  - `GET key` Get the value of the key
  - `DECR key` Decrements the number stored at key by one
  - `INCR key` Increments the number stored at key by one
  - [more...](https://redis.io/commands#string)

- Lists

  - `LINSERT key BEFORE|AFTER pivot value` Inserts value in the list stored at key either before or after the reference value `pivot`.
  - [more...](https://redis.io/commands#list)

- Geo

  - `GEOADD key longitude latitude member [longitude latitude member ...]`` Add one or more geospatial items in the geospatial index represented using a sorted set

- [more...](https://redis.io/commands#)

Have a look to `simple_features/run.rb` file for basic example with redis data types.

For this article, we're going to focus on `PUB/SUB` and `CLUSTER` feature that seem me interesting from my side:

1. `Redis Publish/Subscribe`
2. `Redis Cluster`

## Redis Geospatial Type

file: `geo_features/run.rb`

_Redis_ provides us a very good feature to manipulate geospatial data. Indeed, we can save geospatial data and operate it to get distance, radius...

## Redis Publish/Subscribe

## Redis Cluster
