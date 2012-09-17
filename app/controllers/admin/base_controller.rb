class Admin::BaseController < ApplicationController
  before_filter :authenticate
  layout 'admin'

  ADMIN_USERNAME = (ENV['ADMIN_USERNAME'] or 'admin')
  ADMIN_PASSWORD = (ENV['ADMIN_PASSWORD'] or 'passw0rd')

private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ADMIN_USERNAME and password == ADMIN_PASSWORD
    end
  end
end
