class BaseApiController < ApplicationController
  before_action :parse_request, :authenticate

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @user = User.where(auth_token: token).first
    end
  end

   def parse_request
     @json = JSON.parse(request.body.read)
   end
end