json.extract! event, :id, :begin, :end, :name, :description, :eventtype, :created_at, :updated_at
json.url event_url(event, format: :json)
