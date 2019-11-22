class Trip < ApplicationRecord
  belongs_to :user

  has_many :dailies, dependent: :destroy
  has_many :to_countries, dependent: :destroy
  has_many :to_states, dependent: :destroy
  has_many :to_cities, dependent: :destroy
end
