date_format = schedule.all_day_schedule? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id schedule.id
json.name schedule.name
json.start schedule.start.strftime(date_format)
json.end schedule.end.strftime(date_format)

json.allDay schedule.all_day_schedule? ? true : false

json.edit_url edit_trip_schedule_path(schedule.trip.id, schedule.id)
json.update_url trip_schedule_path(schedule.trip.id, schedule.id, method: :patch)