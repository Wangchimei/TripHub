class City < ApplicationRecord
  belongs_to :state
  belongs_to :country
  has_many :users
  geocoded_by :state
end
