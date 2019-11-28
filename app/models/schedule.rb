class Schedule < ApplicationRecord
  belongs_to :trip
  belongs_to :spot
end
