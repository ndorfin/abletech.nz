env_name = ENV['APP_ENV'] || 'development'
require "environments/#{env_name}"
require 'helpers/asset_helpers'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "/homepage_carousel.html", :layout => false
page "/sitemap.xml", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
	activate :livereload
	set :debug_assets, true
end

ignore '*__config*'

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
set :env_name, env_name
set :service_worker_enabled, ApplicationConfig::SERVICE_WORKER_ENABLED

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :url_root, ApplicationConfig::BASE_URL

activate :directory_indexes

activate :autoprefixer do |config|
	config.browsers = ['last 2 versions', 'Explorer >= 9']
	config.cascade  = false
end

# Build-specific configuration
configure :build do

	activate :gzip do |gzip|
		gzip.exts = %w(.js .css .html .htm .svg .txt .ico)
	end

	# For example, change the Compass output style for deployment
	activate :minify_css

	# Minify Javascript on build
	activate :minify_javascript
	set :js_compressor, Uglifier.new()

	# Enable cache buster
	activate :asset_hash, :ignore => [/blog/, /service-worker/, /touch-icon/, /opengraph/]

	activate :minify_html do |html|
		html.remove_http_protocol    = false
		html.remove_input_attributes = false
		html.remove_quotes           = true
		html.remove_intertag_spaces  = true
	end

	# Use relative URLs
	# activate :relative_assets

	# Or use a different image path
	# set :http_prefix, "/Content/images/"
end

if ApplicationConfig.const_defined?(:S3)
	activate :s3_sync do |s3_sync|
		s3_sync.bucket                     = ApplicationConfig::S3::BUCKET # The name of the S3 bucket you are targeting. This is globally unique.
		s3_sync.region                     = 'ap-southeast-2'     # The AWS region for your bucket.
		s3_sync.aws_access_key_id          = ApplicationConfig::S3::ACCESS_ID
		s3_sync.aws_secret_access_key      = ApplicationConfig::S3::SECRET_KEY
		s3_sync.delete                     = false # We delete stray files by default.
		s3_sync.after_build                = false # We do not chain after the build step by default.
		s3_sync.prefer_gzip                = true
		s3_sync.path_style                 = true
		s3_sync.reduced_redundancy_storage = false
		s3_sync.acl                        = 'public-read'
		s3_sync.encryption                 = false
	end

	default_caching_policy                               max_age: (60 * 60 * 24 * 365), public: true
	individual_caching_policy 'build/service-worker.js', max_age: 0, must_revalidate: true

	activate :cloudfront do |cf|
		cf.access_key_id = ApplicationConfig::S3::ACCESS_ID
		cf.secret_access_key = ApplicationConfig::S3::SECRET_KEY
		cf.distribution_id = ApplicationConfig::S3::CLOUDFRONT_DIST_ID
		cf.filter = /\.html$/i
	end

	after_s3_sync do |files_by_status|
		invalidate(files_by_status[:updated] + files_by_status[:created] + files_by_status[:deleted])
	end
end
