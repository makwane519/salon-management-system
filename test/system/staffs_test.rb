require "application_system_test_case"

class StaffsTest < ApplicationSystemTestCase
  setup do
    @staff = staffs(:one)
  end

  test "visiting the index" do
    visit staffs_url
    assert_selector "h1", text: "Our Team"
  end

  test "should create staff" do
    visit staffs_url
    click_on "Add Staff"

    fill_in "Name", with: "Test Staff"
    fill_in "Role", with: "Hair Stylist"
    fill_in "Phone", with: "9876501236"
    fill_in "Email", with: "test.staff@example.com"
    fill_in "Salary", with: 22000
    fill_in "Joining date", with: Date.current.to_s
    check "Active"
    click_on "Create Staff"

    assert_text "Staff was successfully created"
  end

  test "should update staff" do
    visit staff_url(@staff)
    click_on "Edit this staff"

    fill_in "Name", with: "Updated Staff"
    click_on "Update Staff"

    assert_text "Staff was successfully updated"
  end

  test "should destroy an unbooked staff member" do
    staff = Staff.create!(
      name: "Unbooked Test Staff",
      role: "Beautician",
      phone: "9876501237",
      email: "unbooked.staff@example.com",
      salary: 20000,
      joining_date: Date.current,
      active: true
    )

    visit staff_url(staff)
    click_on "Destroy this staff"

    assert_text "Staff was successfully destroyed"
  end
end
