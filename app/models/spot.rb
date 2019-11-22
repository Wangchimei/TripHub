class Spot < ApplicationRecord
  geocoded_by :name
  has_many :userspots, dependent: :destroy
end
