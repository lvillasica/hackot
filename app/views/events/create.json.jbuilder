json.(@event, :id, :volunteers_needed, :details, :status, :title, :formatted_time)

if @event.errors.present?
  json.error @event.errors.full_messages
end