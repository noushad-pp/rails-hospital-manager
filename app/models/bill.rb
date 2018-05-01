class Bill < ApplicationRecord
  belongs_to :patient
  has_many :bill_item
  accepts_nested_attributes_for :bill_item

  validates_presence_of :bill_item

  after_initialize :set_initial_data

  def set_initial_data
    self.discount = 0
    self.total = 0
  end
end
