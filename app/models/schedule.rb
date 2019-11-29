class Schedule < ApplicationRecord
  attr_accessor :date_range
  belongs_to :trip
  belongs_to :spot

  after_save :update_fields
  after_save :update_travel_cost
  # after_create :set_duration_in_min
  # after_update :set_duration_in_min

  def all_day?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def update_fields
    # update name
    self.update(name: self.spot.name) if self.name != self.spot.name
    # update admission fee
    self.update(admission_fee: self.spot.admission_fee) if self.admission_fee.nil?
    # update duration
    min = (self.end - self.start)/60
    self.update(duration: min) if self.duration != min
  end

  def update_travel_cost
    current_trip = Trip.find(self.trip_id)
    all_spots = current_trip.schedules
    total = []
    all_spots.each do |spot|
      total << spot.admission_fee
      total << spot.other_cost
    end
    binding.pry

    # current_trip.update(est_amount: total) if total != current_trip.est_amount
  end
end
