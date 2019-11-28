class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :user_spots, dependent: :destroy

  validates :name, :address, presence: true
  # after_save :update_geocode

  # private

  # def update_geocode()
  #   h = {}
  #   if self.address.present? 
  #     h[:longitude] = self.address_longitude
  #     h[:latitude] = self.address_latitude
  #   elsif self.name.present? 
  #     h[:longitude] = self.name_longitude
  #     h[:latitude] = self.name_latitude
  #   end
  #   self.update(h)
  # end
end
