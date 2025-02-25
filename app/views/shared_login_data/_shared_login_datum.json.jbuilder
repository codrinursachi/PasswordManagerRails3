json.extract! shared_login_datum, :id, :login_id, :user_id, :created_at, :updated_at
json.urls shared_login_datum.login.urls.map { |url|  url.uri || "" }
json.fav_icons shared_login_datum.login.urls.map { |url| url_for(url.fav_icon) if url.fav_icon.attached? }
json.name shared_login_datum.login.name
json.login_name shared_login_datum.login.login_name
json.shared_with shared_login_datum.user.email_address
json.shared_by shared_login_datum.login.folder.user.email_address
json.url shared_login_datum_url(shared_login_datum, format: :json)
