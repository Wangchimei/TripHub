class Schedule < ApplicationRecord
  attr_accessor :date_range
  belongs_to :trip
  belongs_to :spot

  def all_day_schedule?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
