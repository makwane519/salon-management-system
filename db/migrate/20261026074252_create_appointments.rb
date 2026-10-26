class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :staff, null: false, foreign_key: true
      t.date :appointment_date
      t.string :appointment_time
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
