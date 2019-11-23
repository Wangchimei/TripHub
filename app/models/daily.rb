class Daily < ApplicationRecord
  belongs_to :trip
  has_many :user_spots, dependent: :destroy
end
