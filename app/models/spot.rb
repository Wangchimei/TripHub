class Spot < ApplicationRecord
  geocoded_by :address, if: ->(obj){obj.address.present?}
  geocoded_by :name, if: ->(obj){obj.address.nil?}
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  has_many :userspots, dependent: :destroy
end
