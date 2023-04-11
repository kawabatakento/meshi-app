class SessionsController < ApplicationController
   def new
   end

   def destroy
    redirect_to new_user_registration_path
   end
end
