class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :folders, dependent: :destroy
  has_many :logins, through: :folders
  has_many :urls, through: :logins
  has_many :login_shared_data, dependent: :destroy

  validates :email_address, :password, :password_confirmation, presence: true
  validates :password, confirmation: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
