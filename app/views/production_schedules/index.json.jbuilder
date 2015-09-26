json.array!(@production_schedules) do |production_schedule|
  json.extract! production_schedule, :id
  json.url production_schedule_url(production_schedule, format: :json)
end
