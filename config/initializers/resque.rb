require 'resque_scheduler'

config = YAML.load_file(Rails.root.join('config', 'resque.yml'))
schedule = YAML.load_file(Rails.root.join('config', 'resque_schedule.yml'))

# configure redis connection
Resque.redis = config[Rails.env]
Resque.redis.namespace = "resque:eres_el_cambio"

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

Resque.schedule = schedule
