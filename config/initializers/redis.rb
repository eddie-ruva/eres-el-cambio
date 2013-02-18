require "redis"

redis_conf = File.read(Rails.root.join("config/redis", "#{Rails.env}.conf"))

REDIS = Redis.new(:port => 6379)
