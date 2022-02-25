class Admin::BaseController < ApplicationController
  # before_action :authenticate
 http_basic_authenticate_with name: Rails.configuration.auth[:username], password: Rails.configuration.auth[:password]


=begin  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      if (username == Rails.configuration.auth[:username] && password == Rails.configuration.auth[:password])
        true
      else
        redirect_to cart_path
      end
    end
  end
=end
end