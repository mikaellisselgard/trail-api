# frozen_string_literal: true

class AuthorizeAPIRequestService
  def initialize(headers={})
    @headers = headers
  end

  def perform
    decoded_token ? User.find(decoded_token[:user_id]) : false
  end

  private

  attr_reader :headers

  def decoded_token
    JSONWebToken.decode(token)
  end

  def token
    headers['Authorization'].split(' ').last
  end
end
