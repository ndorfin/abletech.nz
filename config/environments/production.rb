module ApplicationConfig
  BASE_URL = 'https://abletech.nz'

  module GoogleAnalytics
    TRACKING_KEY = 'UA-7731138-1'
  end

  module S3
    BUCKET = 'abletech-nz'
    ACCESS_ID = ENV['AWS_ACCESS_ID']
    SECRET_KEY = ENV['AWS_SECRET_KEY']
    CLOUDFRONT_DIST_ID = 'E3AG7KDTVAFWPJ'
  end
end
