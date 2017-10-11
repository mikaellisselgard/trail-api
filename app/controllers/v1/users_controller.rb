# frozen_string_literal: true

class V1::UsersController < V1::ApplicationController
  skip_before_action :authenticate_request, only: :create
  before_action :ensure_user_schema
  before_action :set_user, only: %w[show update]

  def show
    render json: @user
  end

  def create
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      render json: @user
    else
      render_error(@user, :bad_request)
    end
  end

  def update
    if @user.update_attributes(user_params)
      render json: @user
    else
      render_error(@user, :bad_request)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def ensure_user_schema
    case params[:action]
    when 'create'
      ensure_schema!(Users::BaseSchema)
    when 'update'
      ensure_schema!(Users::UpdateSchema)
    end
  end
end
