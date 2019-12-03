date_format = schedule.all_day? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
json.id schedule.id
json.name schedule.name
json.name schedule.spot.address
json.start schedule.start.strftime(date_format)
json.end schedule.end.strftime(date_format)
json.allDay schedule.all_day? ? true : false
json.edit_url edit_trip_schedule_path(schedule.trip.id, schedule.id)
json.update_url trip_schedule_path(schedule.trip.id, schedule.id, method: :patch)