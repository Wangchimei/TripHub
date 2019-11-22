class ToCity < ApplicationRecord
  belongs_to :city
  belongs_to :trip
  has_many :to_cities, dependent: :destroy
end
