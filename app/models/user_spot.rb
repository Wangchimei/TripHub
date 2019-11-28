class UserSpot < ApplicationRecord
  belongs_to :user
  belongs_to :daily, optional: true
  belongs_to :trip, optional: true
  belongs_to :spot
  validates :user_id, uniqueness: {scope: :spot_id}
end
