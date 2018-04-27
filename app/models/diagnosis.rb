class Diagnosis < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments

  mount_uploader :url, ImageUploader
end
