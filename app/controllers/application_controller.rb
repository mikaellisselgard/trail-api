# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeAPIRequestService.new(request.headers).perform
    render json: { error: 'Not authorized' }, status: 401 unless @current_user
  end

  def ensure_schema!(schema_class)
    schema = Schema.new(schema_class).validation.call(params)
    render_error(schema, :bad_request) unless schema.success?
  end

  def render_error(resource, status)
    render json: { errors: resource.errors }, status: status
  end
end
