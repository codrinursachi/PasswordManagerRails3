class Login < ApplicationRecord
  belongs_to :folder
  has_many :urls, dependent: :destroy
  has_one_attached :file
  accepts_nested_attributes_for :urls, reject_if: :all_blank
  scope :by_folder, ->(folder_id) { where(folder_id: folder_id) }
  scope :by_favorite, -> { where(is_favorite: true) }
  scope :search, ->(term) { joins(:urls).where("name LIKE :term OR login_name LIKE :term OR notes LIKE :term OR urls.uri LIKE :term", term: "%#{term}%") }
end
