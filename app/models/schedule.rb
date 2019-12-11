class Schedule < ApplicationRecord
  attr_accessor :date_range
  belongs_to :trip
  belongs_to :spot
  has_many :pictures, dependent: :destroy

  after_save :update_default_fields
  after_save :update_travel_cost
  after_save :update_duration
  after_destroy :update_travel_cost

  def all_day?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end

  def update_default_fields
    # update name
    self.update(name: self.spot.name) if self.name != self.spot.name
    # update admission fee
    self.update(admission_fee: self.spot.admission_fee) if self.admission_fee.nil?
    # double-check on other cost
    self.update(other_cost: 0) if self.other_cost.nil?
  end

  def update_travel_cost
    current_trip = Trip.find(self.trip_id)
    all_spots = current_trip.schedules
    cost_arr = []
    all_spots.each { |spot| cost_arr << [spot.admission_fee, spot.other_cost] }
    total = cost_arr.flatten.reduce { |sum, n| sum + n }
    current_trip.update(est_amount: total) if total != current_trip.est_amount
  end

  def update_duration
    # schedule duration
    min = (self.end - self.start)/60.round(0)
    self.update(duration: min) if self.duration != min
    # avg duration
    scheduled_spots = Schedule.where(spot_id: self.spot_id)
    time_arr = []
    scheduled_spots.each { |spot| time_arr << spot.duration }
    total_min = time_arr.reduce { |sum, n| sum + n }
    avg_duration = total_min / scheduled_spots.count
    Spot.find(self.spot_id).update(duration: avg_duration)
  end
end
