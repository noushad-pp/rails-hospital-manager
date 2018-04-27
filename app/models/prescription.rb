class Prescription < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
end
