class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :service
  belongs_to :staff

  STATUSES = %w[pending confirmed completed cancelled].freeze

  validates :appointment_date, presence: true
  validates :appointment_time, presence: true
  validates :status, inclusion: { in: STATUSES }

  validates :appointment_date,
            comparison: {
              greater_than_or_equal_to: Date.current
            },
            on: :create
end
