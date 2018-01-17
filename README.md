# Redis Sample

Master in Computer Science - University of Toulon 2018

## Redis Database.

Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker. This database can use a multitude of data structure (strings, hashes, lists, sets, bitmaps, hyperloglogs, geospatial, ...). Its is part of a `key-value` database.

The handling of this tool is very simple!

```terminal
# Save & Retrieve a value
redis> APPEND superkey "Super Value"
redis> GET superkey
"Super Value"
```
