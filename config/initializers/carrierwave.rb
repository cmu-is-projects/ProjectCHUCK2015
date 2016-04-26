Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider => 'AWS'
  }
  config.fog_directory = "projectchuck2015" # name_of_bucket required
  config.asset_host    = 'http://s3.amazonaws.com'               # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
