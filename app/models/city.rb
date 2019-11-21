class City < ApplicationRecord
  geocoded_by :name
  after_validation :geocode, if: :name_changed?
  belongs_to :state
  belongs_to :country
  has_many :users
end
