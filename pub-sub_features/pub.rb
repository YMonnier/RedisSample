require 'redis'
require 'json'

redis = Redis.new(host: "db", port: 6379, db: 1)

begin
  redis.publish(:chat, 'OKOK')
rescue Redis::BaseConnectionError => error
  puts "#{error}, retrying in 1s"
  sleep 1
  retry
end
