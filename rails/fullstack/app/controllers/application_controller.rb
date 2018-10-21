# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # https://gist.github.com/maxivak/a25957942b6c21a41acd
  skip_before_action :verify_authenticity_token, if: :json_request?

  private

  # check if request is JSON or not. 
  # For some reasons, cannot directly use request.format.json? in skip before action
  def json_request?
    request.format.json?
  end
end
