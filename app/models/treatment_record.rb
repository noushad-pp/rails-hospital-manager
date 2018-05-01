class TreatmentRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :admission, optional: true
  belongs_to :employee
  has_one :diagnosis
  has_one :prescription
  accepts_nested_attributes_for :diagnosis
  accepts_nested_attributes_for :prescription

  validates :treatment_date, presence: true
end
