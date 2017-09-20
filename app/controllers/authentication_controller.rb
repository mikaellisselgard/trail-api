# frozen_string_literal: true

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate_user
    service = AuthenticateUserService.call(params[:email], params[:password])
    if service.success?
      render json: { token: service.result }
    else
      render json: { errors: service.errors }, status: :unauthorized
    end
  end
end
