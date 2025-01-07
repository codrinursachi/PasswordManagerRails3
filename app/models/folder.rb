class Folder < ApplicationRecord
  belongs_to :user
  has_many :logins, dependent: :destroy
end
