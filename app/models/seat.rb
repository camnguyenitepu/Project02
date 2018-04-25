class Seat < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :seat_type, optional: true
end
