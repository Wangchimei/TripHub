class Schedule < ApplicationRecord
  attr_accessor :date_range
  belongs_to :trip
  belongs_to :spot

  # after_save :set_duration_in_min
  # after_create :set_duration_in_min
  # after_update :set_duration_in_min

  def all_day?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  # def set_duration_in_min
  #   min = (self.end - self.start)/60
  #   self.update(duration: min)
  # end
end
