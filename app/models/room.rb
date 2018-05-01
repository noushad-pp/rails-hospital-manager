class Room < ApplicationRecord
  belongs_to :room_type
  has_many :admissions
  validates :name, presence: true

  scope :unassigned_rooms, ->{ where(occupied: false) }
end
