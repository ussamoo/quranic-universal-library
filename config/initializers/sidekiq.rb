# frozen_string_literal: true
unless Rails.env.development?
  redis_url = ENV['REDIS_URL'] || 'localhost:6379'
  ENV['REDIS_URL'] = redis_url
end

require 'sidekiq/web'
require 'sidekiq-scheduler/web'
require 'sidekiq-status'
require 'sidekiq-status/web'

# Remove deprecated delayed extensions
# Instead, use ActiveJob with Sidekiq adapter
Rails.application.config.active_job.queue_adapter = :sidekiq

Sidekiq.logger.level = Logger::INFO

# Update to new configuration syntax
Sidekiq.configure_server do |config|
  config.default_job_options = { 'backtrace' => true }
  Sidekiq::Status.configure_server_middleware config
  Sidekiq::Status.configure_client_middleware config
end

Sidekiq.configure_client do |config|
  Sidekiq::Status.configure_client_middleware config
end
