json.extract! shared_login_datum, :id, :login_id, :user_id, :created_at, :updated_at
json.url shared_login_datum_url(shared_login_datum, format: :json)
