module Secured 
  extend ActiveSupport::Concern
  
  def logged_in?
    ## different behaviour per format
    req_format = request.format
    if req_format.html?
      redirect_to '/auth/auth0' unless session[:userinfo].present?
    elsif req_format.json?
      # check if Bearer is here
      begin
        @auth_payload, @auth_header = auth_token
      rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Missing authentication'] }, status: :unauthorized
      end
    elsif req_format.js?
      redirect_to '/auth/auth0' unless session[:userinfo].present?
    else
      puts "unknown format: #{req_format}"
      render json: { errors: ['Invalid format:' + req_format.to_s] }, status: :unauthorized
    end
  end

  private # --------------------------------------------------------------------

  # Fetch Authorization token, if present
  def http_authorization_token
    if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  # Decode authorization token
  def auth_token
    Auth0::JsonWebToken.verify(http_authorization_token)
  end

end
