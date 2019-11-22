class Country < ApplicationRecord
  geocoded_by :name
  belongs_to :continent
  has_many :states
  has_many :cities
  has_many :users
end
