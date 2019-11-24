class UserSpot < ApplicationRecord
  belongs_to :user
  belongs_to :daily, optional: true
  belongs_to :spot
end
