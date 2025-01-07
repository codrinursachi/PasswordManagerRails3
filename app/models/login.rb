class Login < ApplicationRecord
  belongs_to :folder
  has_many :urls, dependent: :destroy
end
