class BaseApiController < ApplicationController
   before_action :parse_request, :authenticate_user_from_token!
   logger.debug("what the ever-living fuck 0")
   logger.debug(@json)
   logger.debug("at least it's talking now")
   private
   def authenticate_user_from_token!
    logger.debug(@json)
    logger.debug("what the ever-living fuck 2")
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
     logger.debug("what the ever-living fuck 1")
     puts "why the ever-living fuck"
   end
end