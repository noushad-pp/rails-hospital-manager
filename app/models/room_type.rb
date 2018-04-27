class RoomType < ApplicationRecord
  validates :name, presence: true
  validates :room_type, presence: true
  validates :charge, presence: true
end
