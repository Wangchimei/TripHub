date_format = userspot.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id userspot.id
json.title userspot.title
json.start userspot.start.strftime(date_format)
json.end userspot.end.strftime(date_format)

json.allDay event.all_day_event? ? true : false

# json.update_url event_path(event, method: :patch)
# json.edit_url edit_event_path(event)