require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Our Customers"
  end

  test "should create customer" do
    visit customers_url
    click_on "Add Customer"

    fill_in "Name", with: "Test Customer"
    fill_in "Phone", with: "9876501234"
    fill_in "Email", with: "test.customer@example.com"
    fill_in "Notes", with: "System test customer"
    click_on "Create Customer"

    assert_text "Customer was successfully created"
  end

  test "should update customer" do
    visit customer_url(@customer)
    click_on "Edit this customer"

    fill_in "Name", with: "Updated Customer"
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
  end

  test "should destroy an unbooked customer" do
    customer = Customer.create!(
      name: "Unbooked Test Customer",
      phone: "9876501235",
      email: "unbooked@example.com"
    )

    visit customer_url(customer)
    click_on "Destroy this customer"

    assert_text "Customer was successfully destroyed"
  end
end
