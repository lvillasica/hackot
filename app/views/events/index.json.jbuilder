json.events @events do |event|
	
	json.id event.id
	json.title event.title
	json.required event.required
	json.actual event.actual
	json.details event.details

end