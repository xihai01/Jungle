class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.auth[:username], password: Rails.configuration.auth[:password]
end