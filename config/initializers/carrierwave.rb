CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => ENV['PROVIDER'],                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                        # required
    :region                 => ENV['REGION'], 
  #  :path_style            => true
                # optional, defaults to 'us-east-1'
    #:host                   => 'Rails.application.secrets.host',             # optional, defaults to nil
    #:endpoint               => 'Rails.application.secrets.endpoint', # optional, defaults to nil
  }
  config.fog_directory  = 's3-heroku-test'                     # required
 # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end