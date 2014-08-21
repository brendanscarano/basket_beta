
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], 
                      {:scope => 'email,read_stream, user_friends',
                      :client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}

end
