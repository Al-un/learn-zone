module Secured 
  extend ActiveSupport::Concern
  
  def logged_in?
    redirect_to '/auth/auth0' unless session[:userinfo].present?
  end
    
end