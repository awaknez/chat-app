class Room < ApplicationRecord
  has many :room_users
  has_many :users, through: :room_users
end
