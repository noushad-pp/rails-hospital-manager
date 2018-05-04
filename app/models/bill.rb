class Bill < ApplicationRecord
  belongs_to :patient
  has_many :bill_item
  accepts_nested_attributes_for :bill_item

  validates_presence_of :bill_item
  validates_presence_of :billing_date

  after_initialize :set_initial_data
  before_save :calculate_total

  def set_initial_data
    self.billing_date ||= Date.today()
    self.discount ||= 0
    self.total ||= 0
    self.tax ||= 0
  end

  def calculate_total
    self.total = 0
    self.bill_item.each { |bill_item| self.total += (bill_item.rate * bill_item.quantity) }
    if self.tax > 0
      self.total += (self.total * self.tax)/100
    end
    self.total -= self.discount
  end
end
