json.extract! service, :id, :name, :description, :price, :duration_minutes, :active, :created_at, :updated_at
json.url service_url(service, format: :json)
