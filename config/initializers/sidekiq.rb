require 'sidekiq'

$sidekiq_redis = proc { 
  r = Redis.new(url: ENV['REDIS_HOST'] || 'redis://localhost:6379')
  Redis::Namespace.new("#{Rails.env}:sidekiq", redis: r)
}

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: Sidekiq.options[:concurrency] + 2, timeout: 1, &$sidekiq_redis)
end if Rails.env.development? or defined?(Rails::Console)

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: Sidekiq.options[:concurrency] + 4, timeout: 1, &$sidekiq_redis)
end