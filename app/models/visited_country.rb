class VisitedCountry < ApplicationRecord
  belongs_to :country
  belongs_to :user
  validates :user_id, uniqueness: {scope: :country_id}
end
