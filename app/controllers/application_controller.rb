class ApplicationController < ActionController::Base
    helper :all

    # def current_user
    #     return unless session[:user_id]
    #     @current_user ||= User.find(session[:user_id])
    #   end
    
    #   def logged_in
    #     !!session[:user_id]
    #   end
end