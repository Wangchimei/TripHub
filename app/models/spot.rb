class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :user_spots, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name, :address, presence: true

  def saved_spot?(spot, user)
    spot.user_spots.find_by(user_id: user.id)
  end

end
