module ApplicationHelper
  def trip_duration(trip)
    (trip.end_day-trip.start_day).to_i + 1
  end
end
