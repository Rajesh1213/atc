class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :http_basic_authenticate

  def http_basic_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      # username == "azr1" && password == "20S0KPNOIM"
      account = Account.where(username: username, auth_id: password).first
      !account.nil?
    end
  end
end
