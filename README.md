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

**[UNDER DEVELOPMENT](https://github.com/redis/redis-rb/pull/730)**

## Redis Publish/Subscribe

[Example HERE](https://github.com/redis/redis-rb/blob/master/examples/pubsub.rb)

- `SUBSCRIBE` will listen to a channel
- `PUBLISH` allows you to push a message into a channel

Behind this functionality we find the websockets system. Indeed, when clients subscribe to one or more channels, it opens a socket connection between the server and the client. As a result, the exchange of messages is quick. Thanks to this system, it is very easy to set up a push notification or instant messaging system.

![pubsub-redis](https://making.pusher.com/images/2017-03-01-redis-pubsub-under-the-hood/clients.svg)

### Example

```terminal
$cli-1> SUBSCRIBE chat
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "chat"
3) (integer) 1
```

```terminal
$cli-2> PUBLISH chat Wow!...
(integer) 1
```

```terminal
$cli-1> SUBSCRIBE chat
Reading messages... (press Ctrl-C to quit)
1) "subscribe"
2) "chat"
3) (integer) 1
1) "message"
2) "chat"
3) "Wow!..."
```

## Redis Cluster

[Testing with a Dockerfile for Redis Cluster](https://github.com/Grokzen/docker-redis-cluster/tree/redis-4.0)

Redis enables data sharing between nodes and automatic failure management. A node is a Redis server instance that uses two ports: a classic communication port to be able to exchange with a Redis client and a specific port (cluster bus port) that manages communication between nodes. The latter is obtained by adding 10,000 to the port of the node. (port redis: 7000, cluster bus: 17000). A cluster contains 16384 hashs distributed over the different nodes used. (`HASH_SLOT = CRC16(key) mod 16384`)

```
+----------------------------------+
|           CLUSTER BUS            |
+----------------------------------+
+--------+   +--------+   +--------+
| master |   | master |   | master |
|  1     |   |    4   |   |   6    |
|      2 |   |   2    |   | 8      |
|  5     |   |      9 |   |      7 |
+--------+   +--------+   +--------+

+--------+   +--------+   +--------+
| slave  |   | slave  |   | slave  |
|   1    |   |   9    |   | 8      |
|     2  |   |    2   |   |     6  |
|  5     |   |   4    |   |   7    |
+--------+   +--------+   +--------+

+--------+   +--------+   +--------+
| slave  |   | slave  |   | slave  |
|   2 5  |   |    4   |   |  8  6  |
|        |   |  3   9 |   |  7     |
|     1  |   |        |   |        |
+--------+   +--------+   +--------+
```

The principle of the slave is to replicate the master data. The Redis cluster will then automatically manage the failures of a master node, after which one of the slaves will become the master node. In this case, no data is lost and the service remains available.

The interest of this feature is to create a certain availability of our system by creating replicates of our masters.

## Conclusion

Redis is a very good NoSQL key-value database tool with advanced features. In practical terms, this kind of database can be used to save user preferences, statistics, scores in a game or even to create a messaging system. However, there are limits to this kind of database, here we are in the NoSQL world, where relationships do not exist, so it is very difficult to develop an administration system with redis. The notions of user and permissions do not also exist...

Before to save everything into a single relational database, it may be interesting to have different databases depending on the cases!
