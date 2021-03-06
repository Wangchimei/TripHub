class Country < ApplicationRecord
  belongs_to :continent
  has_many :states, dependent: :destroy
  # has_many :cities, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :to_countries, dependent: :destroy
  has_many :visited_countries, dependent: :destroy
  has_many :travellers, through: :visited_countries, source: :user
end
