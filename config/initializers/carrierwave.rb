CarrierWave.configure do |config|
  config.dropbox_app_key = "e2d91mi5wdeejuj" 
  config.dropbox_app_secret = ENV["APP_SECRET"]
  config.dropbox_access_token = "tcphzjzmon2i7vtl" 
  config.dropbox_access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  config.dropbox_user_id = "195992293"
  config.dropbox_access_type = "app_folder"
end