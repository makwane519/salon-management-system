json.extract! appointment, :id, :customer_id, :service_id, :staff_id, :appointment_date, :appointment_time, :status, :notes, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
