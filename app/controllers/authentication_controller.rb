# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate_user
    token = AuthenticateUserService.new(
      params[:email], params[:password]
    ).perform

    if token
      render json: { token: token }
    else
      render json: { errors: 'invalid credentials' }, status: :unauthorized
    end
  end
end
