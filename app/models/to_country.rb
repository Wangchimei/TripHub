class ToCountry < ApplicationRecord
  belongs_to :country, optional:true
  belongs_to :trip, optional:true
end
