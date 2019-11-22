class Daily < ApplicationRecord
  belongs_to :trip
  has_many :userspots, dependent: :destroy
end
