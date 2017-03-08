class BaseApiController < ApplicationController
   before_action :parse_request, :authenticate_user_from_token!
   Rails.logger.debug("what the ever-living fuck")
   private
   def authenticate_user_from_token!
    Rails.logger.debug(@json)
    Rails.logger.debug("what the ever-living fuck")
    puts @json
    puts "why the ever-living fuck"
     if !@json['api_token']
       render nothing: true, status: :unauthorized
     else
       @user = nil
       User.find_each do |u|
         if Devise.secure_compare(u.api_token, @json['api_token'])
           @user = u
         end
       end
     end
   end

   def parse_request
     @json = JSON.parse(request.body.read)
     Rails.logger.debug("what the ever-living fuck")
     puts "why the ever-living fuck"
   end
end