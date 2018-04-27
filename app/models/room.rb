class Room < ApplicationRecord
  belongs_to :room_type
  validates :name, presence: true
end
