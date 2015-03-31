module ApplicationConfig
  BASE_URL = 'https://staging.abletech.nz'

  module GoogleAnalytics
    TRACKING_KEY = 'UA-7731138-1'
  end

  module S3
    BUCKET = ENV['AWS_BUCKET_ID_STAGING']
    ACCESS_ID = ENV['AWS_ACCESS_ID_STAGING']
    SECRET_KEY = ENV['AWS_SECRET_KEY_STAGING']
    CLOUDFRONT_DIST_ID = ENV['AWS_CLOUDFRONT_ID_STAGING']
  end
end
