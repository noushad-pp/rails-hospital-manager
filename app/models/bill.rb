class Bill < ApplicationRecord
  belongs_to :patient
  belongs_to :bill_items
end
