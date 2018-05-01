class Admission < ApplicationRecord
  belongs_to :patient
  belongs_to :room

  after_save :update_room_status
  after_initialize :set_current_date

  def set_current_date
    self.admission_date ||= Date.today
  end

  def update_room_status
    room = Room.find(self.room_id)
    room.occupied = (self.admission_date.present? && (self.discharge_date.blank? || self.discharge_date <= Date.today))
    room.save!
  end
end
