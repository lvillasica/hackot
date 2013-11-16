json.events @events do |event|

	json.id event.id
	json.title event.title
	json.required event.required
	json.actual event.actual
	json.details event.details
  json.title event.title
  json.formatted_time event.formatted_time
  json.volunteers_needed event.volunteers_needed
end