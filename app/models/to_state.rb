class ToState < ApplicationRecord
  belongs_to :state, optional:true
  belongs_to :trip
end
