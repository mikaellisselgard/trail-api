# frozen_string_literal: true

require 'jwt'

module AuthSupport
  def generate_jwt(user)
    "Authorization: #{JSONWebToken.encode user_id: user.id if user}"
  end
end
