class Trip < ApplicationRecord
  belongs_to :user

  has_many :dailies, dependent: :destroy
  has_many :to_countries, dependent: :destroy
  has_many :to_states, dependent: :destroy
  has_many :to_cities, dependent: :destroy
  has_many :destination_countries, through: :to_countries, source: :country
  has_many :destination_states, through: :to_states, source: :country
  has_many :destination_cities, through: :to_cities, source: :country

  accepts_nested_attributes_for :to_countries, allow_destroy: true
  accepts_nested_attributes_for :to_states, allow_destroy: true
  accepts_nested_attributes_for :to_cities, allow_destroy: true
end
