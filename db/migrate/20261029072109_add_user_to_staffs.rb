class AddUserToStaffs < ActiveRecord::Migration[8.0]
  def change
    add_reference :staffs, :user, foreign_key: true, index: { unique: true }
  end
end
