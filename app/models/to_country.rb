class ToCountry < ApplicationRecord
  belongs_to :country
  belongs_to :trip
end
