class State < ApplicationRecord
  geocoded_by :name
  after_validation :geocode, if: :name_changed?
  belongs_to :country
  has_many :cities
  has_many :users
end
