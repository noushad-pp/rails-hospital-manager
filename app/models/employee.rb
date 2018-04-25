class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :employee_role
end
