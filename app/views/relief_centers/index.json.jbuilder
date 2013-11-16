json.relief_centers @relief_centers do |relief_center|

  json.id relief_center.id
  json.name relief_center.name
  json.events_count relief_center.events.active.count(0)

end