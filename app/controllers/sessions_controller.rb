class SessionsController < ApplicationController
   def new
   end

   def destroy
    sign_out current_user
    redirect_to new_user_registration_path
   end
end
