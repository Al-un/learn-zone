require 'uri'
require 'net/http'

class WelcomeController < ApplicationController

  def index
  end

  def register
    email = params[:email]
    password = params[:password]
    first_name = params[:first_name]
    last_name = params[:last_name]

    url = URI("https://al-un-dev.eu.auth0.com/dbconnections/signup")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/json'
    request.body = "{\"client_id\": \"ObQqZ8cA6qe17h936NJW4B6nfFWjYRhU\",
    \"email\": \"#{email}\",
    \"password\": \"#{password}\",
    \"user_metadata\":{
      \"given_name\": \"#{first_name}\",
      \"family_name\": \"#{last_name}\",
      \"phone_number\": \"123456789\"
    },
    \"connection\": \"Username-Password-Authentication\"
    }"
    
    puts 'Auth0 request: ' + request.body
    response = http.request(request)
    puts 'Auth0 response: ' + response.read_body
  end
end