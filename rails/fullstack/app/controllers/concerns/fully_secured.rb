module FullySecured
  extend ActiveSupport::Concern
  
  included do
    before_action :logged_in?
  end

  def logged_in?
    redirect_to '/auth/auth0' unless session[:userinfo].present?
  end
    
end