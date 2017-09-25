# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private def authenticate_request
    @current_user = AuthorizeAPIRequestService.new(request.headers).perform
    render json: { error: 'Not authorized' }, status: 401 unless @current_user
  end
end
