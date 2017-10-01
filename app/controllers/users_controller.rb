# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create
  before_action :set_user, only: %w[show update]

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
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

  private def set_user
    @user = User.find(params[:id])
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
