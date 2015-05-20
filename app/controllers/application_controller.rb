class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def verify_vendor
  	unless signed_in? && current_user.vendor
  		redirect_to new_user_session_path, :alert => "You must be signed in to access that page."
  	end
  end
end
