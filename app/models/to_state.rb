class ToState < ApplicationRecord
  belongs_to :state
  belongs_to :trip
  has_many :to_states, dependent: :destroy
end
