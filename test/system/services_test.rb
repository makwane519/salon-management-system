require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Our Services"
  end

  test "should create service" do
    visit services_url
    click_on "Add New Service"

    fill_in "Name", with: "Test Haircut"
    fill_in "Description", with: "Test service"
    fill_in "Duration minutes", with: 30
    fill_in "Price", with: 450
    check "Active"
    click_on "Create Service"

    assert_text "Service was successfully created"
  end

  test "should update service" do
    visit service_url(@service)
    click_on "Edit this service"

    fill_in "Name", with: "Updated Haircut"
    fill_in "Price", with: 400
    click_on "Update Service"

    assert_text "Service was successfully updated"
  end

  test "should destroy an unbooked service" do
    service = Service.create!(
      name: "Unbooked Test Service",
      price: 100,
      duration_minutes: 30,
      active: true
    )

    visit service_url(service)
    click_on "Destroy this service"

    assert_text "Service was successfully destroyed"
  end
end
