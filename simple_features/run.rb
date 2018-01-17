require 'redis'


begin
    redis = Redis.new(host: "192.168.99.100", port: 6379, db: 1)
    redis.set("mykey", "hello world")
    puts redis.get("mykey")
rescue Exception => e
  puts e.inspect
  # => #<Redis::CannotConnectError: Timed out connecting to Redis on 10.0.1.1:6380>

  puts e.message
  # => Timed out connecting to Redis on 10.0.1.1:6380
end
