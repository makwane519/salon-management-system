class CreateStaffs < ActiveRecord::Migration[8.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :role
      t.string :phone
      t.string :email
      t.decimal :salary
      t.date :joining_date
      t.boolean :active

      t.timestamps
    end
  end
end
