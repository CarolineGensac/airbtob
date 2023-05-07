class User < ApplicationRecord
  has_many :reservations
  has_many :flats, through: :reservations
  belongs_to :city

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    
  # validates :phone_number, presence: true, if: :receive_sms_notifications?

  #   def receive_sms_notifications?
  #     receive_sms_notifications == true
  #   end

end
