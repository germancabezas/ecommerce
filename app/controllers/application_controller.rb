class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def authenticate_admin!
		if !(user_signed_in? && current_user.admin)
			flash[:warning] = " Please don't try to edit "
			redirect_to "/"
		end
	end



  
end
