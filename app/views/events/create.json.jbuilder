json.(@event, :id, :volunteers_needed, :details, :status)

if @event.errors.present?
  json.error @event.errors.full_messages
end