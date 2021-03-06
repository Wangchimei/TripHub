date_format = schedule.all_day? ? '%Y-%m-%d' : '%Y-%m-%d %H:%M'
json.id schedule.id
json.name schedule.name
json.start schedule.start_time.strftime(date_format)
json.end schedule.end_time.strftime(date_format)
json.allDay schedule.all_day? ? true : false
json.admission_fee schedule.admission_fee
json.other_cost schedule.other_cost
json.edit_url edit_trip_schedule_path(schedule.trip.id, schedule.id)
json.update_url trip_schedule_path(schedule.trip.id, schedule.id, method: :patch)

json.spot do
  json.image schedule.spot.main_image
  json.address schedule.spot.address
  json.lat schedule.spot.latitude
  json.lng schedule.spot.longitude
end