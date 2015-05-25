CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                                       # required
    aws_access_key_id:     ENV['AMAZON_ACCESS_KEY'],                      # required
    aws_secret_access_key: ENV['AMAZON_SECRET_KEY'],  # required
    region:                'eu-central-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'colloc'                     # required
end
