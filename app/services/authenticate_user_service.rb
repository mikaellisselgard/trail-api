# frozen_string_literal: true

class AuthenticateUserService
  attr_reader :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def perform
    user = User.find_by(email: email)
    return false unless user&.authenticate(password)
    JSONWebToken.encode user_id: user.id
  end
end
