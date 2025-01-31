class SharedLoginDatum < ApplicationRecord
  belongs_to :login
  belongs_to :user
end
