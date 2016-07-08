module ApplicationConfig
  BASE_URL = 'http://localhost:4567'

  SERVICE_WORKER_ENABLED = ENV['SW_ENABLED'] || false

  module GoogleAnalytics
    TRACKING_KEY = 'UA-7731138-1'
  end
end
