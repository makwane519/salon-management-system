class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  has_one :staff, dependent: :nullify

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  enum :role, {
    admin: "admin",
    receptionist: "receptionist",
    staff: "staff"
  }, default: :staff

  normalizes :email_address, with: ->(email) { email.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
end