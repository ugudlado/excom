json.extract! meeting, :id, :start_date, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
