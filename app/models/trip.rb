class Trip < ApplicationRecord
  belongs_to :user

  has_many :dailies, dependent: :destroy
  has_many :to_countries, dependent: :destroy
  has_many :to_states, dependent: :destroy
  has_many :to_cities, dependent: :destroy
  has_many :destination_countries, through: :to_countries, source: :country
  has_many :destination_states, through: :to_states, source: :state
  has_many :destination_cities, through: :to_cities, source: :city

  accepts_nested_attributes_for :to_countries, allow_destroy: true
  accepts_nested_attributes_for :to_states, allow_destroy: true
  accepts_nested_attributes_for :to_cities, allow_destroy: true

  def self.to_country_build
    trip = self.new
    trip.to_countries.build
    trip
  end

  def self.to_state_build
    trip = self.new
    trip.to_states.build
    trip
  end

  def self.to_city_build
    trip = self.new
    trip.to_cities.build
    trip
  end
end
