class ToCity < ApplicationRecord
  belongs_to :city, optional:true
  belongs_to :trip, optional:true
end