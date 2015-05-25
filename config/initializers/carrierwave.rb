CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AMAZON_ACCESS_KEY'],
      aws_secret_access_key: ENV['AMAZON_SECRET_KEY'],
      region:                'eu-central-1'
    }
    config.fog_directory  = 'colloc'
  end
end
