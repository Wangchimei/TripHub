class Spot < ApplicationRecord
  include ImageResult

  after_validation :google_places
  # after_ :set_default_img

  has_many :user_spots, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name, :address, presence: true


  def saved_spot?(spot, user)
    spot.user_spots.find_by(user_id: user.id)
  end

  def google_places
    if self.latitude.nil?
      init = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
      result = init.spot(self.place_id)
      self.formatted_name = result.name if result.name
      self.formatted_address = result.formatted_address if result.formatted_address
      self.latitude = result.lat
      self.longitude = result.lng
      set_default_img if self.main_image.nil?
    end
  end

  def set_default_img
    if self.main_image.nil?
      # if !self.formatted_name.nil?
        search_term = self.formatted_name
      # else
      #   search_term = self.formatted_address.match(/([a-zA-Z]*) (City)/)[1]
      # end
    url = ImageResult.get_url(search_term)
    self.main_image = url
    end
  end
end
