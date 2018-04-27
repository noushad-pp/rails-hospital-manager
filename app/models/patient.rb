class Patient < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true

  mount_uploader :image, ImageUploader
end
