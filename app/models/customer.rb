class Customer < ApplicationRecord
  has_many :appointments, dependent: :restrict_with_error
  validates :name, presence: true

  validates :phone,
            presence: true,
            format: {
              with: /\A[0-9+\-\s()]{7,20}\z/,
              message: "must be a valid phone number"
            }

  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: "must be a valid email address"
            },
            allow_blank: true
end
