class Country < ApplicationRecord
  geocoded_by :name
  after_validation :geocode, if: :name_changed?
  belongs_to :continent
  has_many :states
  has_many :cities
  has_many :users
end
