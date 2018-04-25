class TreatmentRecord < ApplicationRecord
  belongs_to :patient
  belongs_to :admission
  belongs_to :employee
  belongs_to :diagnosis
  belongs_to :prescription
end
