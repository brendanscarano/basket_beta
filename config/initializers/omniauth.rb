
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 'FACEBOOK APP ID', 'FACEBOOK SECRET', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['1444194725830602'], ENV['fa4646a7577ef8e794ed0e1a2e4be403']
# end