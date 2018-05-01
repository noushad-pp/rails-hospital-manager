class Prescription < ApplicationRecord
  belongs_to :treatment_record
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments

  mount_uploader :url, ImageUploader
end
