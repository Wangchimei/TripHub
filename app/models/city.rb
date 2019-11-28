class City < ApplicationRecord
  belongs_to :country
  belongs_to :state
  has_many :users, dependent: :destroy
end
