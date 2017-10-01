# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :set_location, only: %w[show update destroy]
  before_action :find_locatables, only: :create

  def index
    render json: current_user.locations
  end

  def show
    render json: @location
  end

  def closest
    @location = Location.closest_by(
      [params[:lat], params[:lng]],
      params[:type],
      current_user.id
    )

    render json: @location
  end

  def within
    @locations = Location.within_by(
      params[:distance],
      [params[:lat], params[:lng]],
      params[:type],
      current_user.id
    )

    render json: @locations
  end

  def create
    @location = current_user.locations.create(location_params)
    @locatables&.map { |l| @location.locatable_items.build(locatable: l) }

    if @location.save
      render json: @location
    else
      render_error(@location, :bad_request)
    end
  end

  def update
    if @location.update_attributes(location_params)
      render json: @location
    else
      render_error(@location, :bad_request)
    end
  end

  def destroy
    @location.destroy ? :ok : :bad_request
  end

  private

  def set_location
    @location = current_user.locations.find(params[:id])
  end

  def find_locatables
    locatable_type = Location::ACCEPTED_TYPES.find do |type|
      type == params[:type]
    end

    return nil if locatable_type.blank?

    @locatables = locatable_type
                  .classify
                  .constantize
                  .where(id: params[:item_ids])
  end

  def location_params
    params.require(:location).permit(
      :lng,
      :lat,
      :user_id,
      :type,
      item_ids: %i[id]
    )
  end
end
