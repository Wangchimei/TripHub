class Trip < ApplicationRecord
  include ImageResult
  belongs_to :user

  has_many :schedules, dependent: :destroy
  has_many :to_countries, dependent: :destroy
  has_many :to_states, dependent: :destroy
  has_many :to_cities, dependent: :destroy
  has_many :destination_countries, through: :to_countries, source: :country
  has_many :destination_states, through: :to_states, source: :state
  has_many :destination_cities, through: :to_cities, source: :city

  accepts_nested_attributes_for :to_countries, allow_destroy: true
  accepts_nested_attributes_for :to_states, allow_destroy: true
  accepts_nested_attributes_for :to_cities, allow_destroy: true

  after_save :set_default_img
  enum status: { planning: 0, finished: 1}

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

  def set_default_img
    if self.trip_image.nil?
      if self.destination_states.present?
        search_term = "#{self.destination_states.first.name} #{self.destination_countries.first.name}"
      else
        search_term = "#{self.destination_countries.first.name}"
      end
      img = Unsplash::Photo.random(query: search_term, orientation: "landscape")
      url = ImageResult.get_url(img)
      self.update(trip_image: url)
    end
  end
end
