class Login < ApplicationRecord
  belongs_to :folder
  has_many :urls, dependent: :destroy
  accepts_nested_attributes_for :urls, reject_if: :all_blank
  scope :by_folder, ->(folder_id) { where(folder_id: folder_id) }
end
