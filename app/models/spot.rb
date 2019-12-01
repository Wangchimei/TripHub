class Spot < ApplicationRecord
  include ImageResult
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  after_save :set_default_img, if: :address_changed?

  has_many :user_spots, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name, :address, presence: true


  def saved_spot?(spot, user)
    spot.user_spots.find_by(user_id: user.id)
  end

  def set_default_img
    reverse_geocode = Geocoder.search([self.latitude, self.longitude])
    location_1 = result[0].address_components[-3]["long_name"]
    location_2 = result[0].address_components[-5]["long_name"]
    Unsplash::Photo.random(query: "#{location_1} #{location_2}", orientation: "landscape")
    url = ImageResult.get_url(img)
    self.update(main_image: url)
  end
end
