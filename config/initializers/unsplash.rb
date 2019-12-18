Unsplash.configure do |config|
  config.application_access_key = ENV['SPLASH_ACCESS_KEY']
  config.application_secret = ENV['SPLASH_SECRET_KEY']
  # config.application_redirect_uri = "https://trip-hub.herokuapp.com/oauth/callback"
  config.utm_source = "triphub_app"
end