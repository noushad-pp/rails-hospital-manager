class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :employee_role

  GENDER = ["MALE", "FEMALE", "OTHER"]
  EMPLOYEE_TYPE = ["PERMANENT", "VISITING", "INTERN"]

  validates :name, presence: true
  validates :department, presence: true
  validates :employee_role, presence: true
  validates :phone, presence: true

  mount_uploader :image, ImageUploader
end
