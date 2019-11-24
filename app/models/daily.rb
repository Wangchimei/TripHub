class Daily < ApplicationRecord
  belongs_to :trip
  has_many :user_spots, dependent: :destroy
  accepts_nested_attributes_for :user_spots, allow_destroy: true
end
