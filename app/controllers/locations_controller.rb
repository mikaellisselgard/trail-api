# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :ensure_location_schema
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
      Coordinate.new(params[:lat], params[:lng]),
      params[:type], current_user.id
    )
    render json: @location
  end

  def within
    @locations = Location.within_by(
      Area.new(
        params[:distance],
        Coordinate.new(params[:lat], params[:lng])
      ),
      params[:type], current_user.id
    )
    render json: @locations
  end

  def create
    @location = current_user.locations.create(
      lat: params[:lat], lng: params[:lng]
    )
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

  def ensure_location_schema
    case params[:action]
    when 'closest'
      ensure_schema!(Locations::ClosestSchema)
    when 'within'
      ensure_schema!(Locations::WithinSchema)
    when 'create'
      ensure_schema!(Locations::CreateSchema)
    when 'update'
      ensure_schema!(Locations::UpdateSchema)
    end
  end
end
