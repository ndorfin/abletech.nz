module ApplicationConfig
  BASE_URL = 'https://abletech.nz'

  module GoogleAnalytics
    TRACKING_KEY = 'UA-7731138-1'
  end

  module S3
    BUCKET = ENV['AWS_BUCKET_ID_PRODUCTION']
    ACCESS_ID = ENV['AWS_ACCESS_ID_PRODUCTION']
    SECRET_KEY = ENV['AWS_SECRET_KEY_PRODUCTION']
    CLOUDFRONT_DIST_ID = ENV['AWS_CLOUDFRONT_ID_PRODUCTION']
  end
end
