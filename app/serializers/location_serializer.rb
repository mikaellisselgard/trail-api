# frozen_string_literal: true

class LocationSerializer < ActiveModel::Serializer
  attributes :id, :lng, :lat, :distance
  has_many :fishes
  has_many :mushrooms

  def distance
    (object.distance * 1000).round(3) if object.distance
  end

  def serializable_hash(
    adapter_options=nil,
    options={},
    adapter_instance=self.class.serialization_adapter_instance
  )
    hash = super
    hash.each { |k, v| hash.delete(k) if v.blank? }
    hash
  end
end
