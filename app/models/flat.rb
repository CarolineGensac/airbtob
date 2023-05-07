class Flat < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :city

  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :has_wifi, inclusion: { in: [true, false] }

end
