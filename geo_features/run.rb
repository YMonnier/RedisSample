require 'redis'

def from_redis(m)
    "REDIS: #{m}"
end

begin
    #
    # Geo command is under development
    # https://github.com/redis/redis-rb/pull/730
    #
    puts 'Geo Features Ruby Script'
    puts '--> GEOADD key longitude latitude'
    redis = Redis.new(host: "db", port: 6379, db: 1)
    cities = [
        {
            "name": "Toulon",
            "pos": [5.927999999999997, 43.124228] # [lon, lat]
        },
        {
            "name": "La Garde",
            "pos": [6.017199000000005, 43.128777] # [lon, lat]
        },
        {
            "name": "Cuers",
            "pos": [6.072199899999987, 43.237875] # [lon, lat]
        }
    ]

    cities.each do |c|
        pos = c[:pos]
        puts "  GEOADD #{c[:name]} #{pos[0]} #{pos[1]} "
        # redis.geoadd(c[:name], pos[0], pos[1])
    end

rescue Exception => e
    puts e.inspect
    puts e.message
end
