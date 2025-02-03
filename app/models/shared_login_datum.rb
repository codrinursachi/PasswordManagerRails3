class SharedLoginDatum < ApplicationRecord
  belongs_to :login
  belongs_to :user

  scope :by_current_user, ->(belongs_to_current_user) { belongs_to_current_user ? joins(login: :folder).where(folders: { user_id: Current.user.id }) : joins(login: :folder).where.not(folders: { user_id: Current.user.id }) }
end
