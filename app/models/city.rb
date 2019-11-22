class City < ApplicationRecord
  geocoded_by :name
  belongs_to :state
  belongs_to :country
  has_many :users, dependent: :destroy
end
