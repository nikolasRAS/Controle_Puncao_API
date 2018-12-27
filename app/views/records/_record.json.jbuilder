json.extract! record, :id, :protocol, :patient, :age_range_id, :age, :created_at, :updated_at
json.url record_url(record, format: :json)
