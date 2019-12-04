json.array! @schedules do |schedule|
  date_format = schedule.all_day? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M'
  json.id schedule.id
  json.name schedule.name
  json.start schedule.start.strftime(date_format)
  json.end schedule.end.strftime(date_format)
  json.allDay schedule.all_day? ? true : false
  json.edit_url edit_trip_schedule_path(schedule.trip.id, schedule.id)
  json.update_url trip_schedule_path(schedule.trip.id, schedule.id, method: :patch)

  json.spot do
    json.address schedule.spot.address
    json.lat schedule.spot.latitude
    json.lng schedule.spot.longitude
  end
end