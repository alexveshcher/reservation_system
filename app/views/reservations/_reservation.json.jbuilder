json.extract! reservation, :id, :from, :to, :user_id, :table_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
