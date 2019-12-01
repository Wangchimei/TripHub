class Spot < ApplicationRecord
  include ImageResult
  geocoded_by :formatted_name
  after_validation :geocode, if: :formatted_name_changed?
  after_save :set_default_img

  has_many :user_spots, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name, :address, presence: true


  def saved_spot?(spot, user)
    spot.user_spots.find_by(user_id: user.id)
  end

  def set_default_img
    if self.main_image.nil?
    search_term = self.formatted_name
    img = Unsplash::Photo.random(query: search_term, orientation: "landscape")
    url = ImageResult.get_url(img)
    self.update(main_image: url)
    end
  end
end
