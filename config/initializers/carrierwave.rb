Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS'
  }
  config.fog_directory = "uif-theater" # name_of_bucket required
  config.fog_host       = 'http://s3.amazonaws.com'               # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

# # config/initializers/carrierwave.rb
# CarrierWave.configure do |config|
#   config.root = Rails.root.join('tmp') # adding these...
#   config.cache_dir = 'carrierwave' # ...two lines
# 
#   config.s3_access_key_id = ENV['AKIAJH35E2YQNTDB4SQQ']
#   config.s3_secret_access_key = ENV['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']
#   config.s3_bucket = ENV['s3_bucket']
# end