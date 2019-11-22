class State < ApplicationRecord
  geocoded_by :name
  belongs_to :country
  has_many :cities
  has_many :users
end
