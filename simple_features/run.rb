require 'redis'

def from_redis(m)
    "REDIS: #{m}"
end

begin
    puts 'Simple Features Ruby Script'
    redis = Redis.new(host: "db", port: 6379, db: 1)

    #
    # GET SET
    puts "--> GET / SET"
    (a, b) = ['superkey', 'Super Value!']
    puts "      set '#{a}' '#{b}'... "
    redis.set(a, b)
    puts "      #{from_redis("'#{a}' => #{redis.get(a)}")}"

    #
    # LIST
    puts "--> LIST"
    list = []
    key_list = "superlist"
    nb_element = 10
    for i in 0..nb_element
        value = "element #{i + 1}"
        list.push(value)
        puts "  add '#{value}' value to the list '#{key_list}'"
        puts "      #{from_redis("LLEN #{key_list} => #{redis.llen(key_list)}")}"
        redis.rpush(key_list, value)
    end

    puts "  get list '#{key_list}' from 0 to #{nb_element - 1} "
    puts "      #{from_redis redis.lrange(key_list, 0, nb_element - 1)}"

    for i in 0..nb_element
        puts "  pop list '#{key_list}' ==> #{redis.lpop(key_list)}"
        puts "      #{from_redis("LLEN #{key_list} => #{redis.llen(key_list)}")}"
    end

rescue Exception => e
    puts e.inspect
    puts e.message
end
