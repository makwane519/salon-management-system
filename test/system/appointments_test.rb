require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  setup do
    @appointment = appointments(:one)
  end

  test "visiting the index" do
    visit appointments_url
    assert_selector "h1", text: "Appointments"
  end

  test "should create appointment" do
    visit appointments_url
    click_on "New appointment"

    select @appointment.customer.name, from: "Customer"
    select @appointment.service.name, from: "Service"
    select @appointment.staff.name, from: "Staff Member"
    fill_in "Appointment date", with: (Date.current + 1.day).to_s
    fill_in "Appointment Time", with: "12:30"
    select "Pending", from: "Status"
    fill_in "Notes", with: "System test appointment"
    click_on "Create Appointment"

    assert_text "Appointment was successfully created"
  end

  test "should update appointment" do
    visit appointment_url(@appointment)
    click_on "Edit this appointment"

    fill_in "Appointment Time", with: "13:30"
    click_on "Update Appointment"

    assert_text "Appointment was successfully updated"
  end

  test "should destroy appointment" do
    visit appointment_url(@appointment)
    click_on "Destroy this appointment"

    assert_text "Appointment was successfully destroyed"
  end
end
