class BillItem < ApplicationRecord
  belongs_to :bill

  after_initialize :set_initial_data

  def set_initial_data
    self.discount = 0
    self.rate = 0
    self.quantity = 1
  end
end
