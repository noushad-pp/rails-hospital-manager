class BillItem < ApplicationRecord
  belongs_to :bill

  after_initialize :set_initial_data

  validates_presence_of :bill_type
  validates_presence_of :title

  def set_initial_data
    self.discount ||= 0
    self.rate ||= 0
    self.quantity ||= 1
  end
end
