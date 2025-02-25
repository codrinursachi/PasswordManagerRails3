json.extract! shared_login_datum, :id, :login_id, :user_id, :created_at, :updated_at
json.login do
  json.partial! "logins/login", login: shared_login_datum.login
  json.shared_with shared_login_datum.user.email_address
  json.shared_by shared_login_datum.login.folder.user.email_address
  json.shared_id shared_login_datum.id
end
json.url shared_login_datum_url(shared_login_datum, format: :json)
