json.extract! login, :id, :name, :login_name, :login_password, :notes, :is_favorite, :folder_id, :created_at, :updated_at
json.url login_url(login, format: :json)
