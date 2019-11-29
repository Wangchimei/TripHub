class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :country
  belongs_to :state, optional: true
  belongs_to :city, optional: true

  has_many :trips, dependent: :destroy
  has_many :user_spots, dependent: :destroy
  has_many :saved_spots, through: :user_spots, source: :spot
  has_many :visited_countries, dependent: :destroy
  has_many :countries_conquered, through: :visited_countries, source: :country

  def save_spot!(spot)
    user_spots.create!(spot_id: spot.id)
  end

  def unsave_spot!(spot)
    user_spots.find_by(spot_id: spot.id).destroy
  end

  def visited!(countries)
    visited_countries.create!(country_id: countries.first.id)
  end

  def unvisited!(countries)
    visited_countries.find_by(country_id: countries.first.id).destroy
  end
end
