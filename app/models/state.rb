class State < ApplicationRecord
  geocoded_by :name
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_many :users, dependent: :destroy
end
