CarrierWave.configure do |config|
  if Rails.env.production? 
    config.storage :aws 
    config.aws_credentials = {
      :access_key_id      => ENV["AWS_ACCESS_KEY_ID"],                        # required
      :secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"],
      :region  => ENV['AWS_BUCKET_REGION']                        # required
    }
    config.aws_bucket = ENV["AWS_BUCKET_NAME"] # required
  else
    config.storage :file
  end
end
