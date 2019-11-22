class UserSpot < ApplicationRecord
  belongs_to :user
  belongs_to :daily
  belongs_to :spot
end
