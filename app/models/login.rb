class Login < ApplicationRecord
  belongs_to :folder
  has_many :urls, dependent: :destroy
  has_many :custom_fields, dependent: :destroy
  has_one_attached :file

  validates :name, :login_name, :login_password, presence: true

  accepts_nested_attributes_for :urls, reject_if: :all_blank
  accepts_nested_attributes_for :custom_fields, reject_if: :all_blank

  scope :by_folder, ->(folder_id) { where(folder_id: folder_id) }
  scope :by_favorite, -> { where(is_favorite: true) }
  scope :search, ->(term) { joins(:urls).where("name LIKE :term OR login_name LIKE :term OR notes LIKE :term OR urls.uri LIKE :term", term: "%#{term}%") }
  scope :by_not_in_trash, -> { where(date_added_in_trash: nil) }
  scope :by_in_trash, -> { where.not(date_added_in_trash: nil) }
end
