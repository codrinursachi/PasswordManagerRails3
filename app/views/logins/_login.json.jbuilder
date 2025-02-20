json.extract! login, :id, :name, :login_name, :login_password, :notes, :is_favorite, :folder_id, :created_at, :updated_at
json.urls login.urls.map { |url|  url.uri  }
json.fav_icons login.urls.map { |url| url_for(url.fav_icon) if url.fav_icon.attached? }
json.custom_fields login.custom_fields.map { |custom_field| { name: custom_field.name, value: custom_field.value } }
json.url login_url(login, format: :json)
