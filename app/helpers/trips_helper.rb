module TripsHelper
  def date_default
    if action_name == "edit"
    start_day = @trip.start_day.strftime("%Y-%m-%d").to_s
    end_day = @trip.end_day.strftime("%Y-%m-%d").to_s
    start_day + " - " + end_day
    end
  end
end
