class Schedule < ApplicationRecord
  attr_accessor :date_range
  belongs_to :trip
  belongs_to :spot

  after_save :set_duration_in_min
  after_save :update_fields
  # after_create :set_duration_in_min
  # after_update :set_duration_in_min

  def all_day?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def set_duration_in_min
    min = (self.end - self.start)/60
    self.update(duration: min) if self.duration != min
  end

  def update_fields
    self.update(name: self.spot.name) if self.name != self.spot.name
    self.update(admission_fee: self.spot.admission_fee) if self.admission_fee.nil?
  end
end
