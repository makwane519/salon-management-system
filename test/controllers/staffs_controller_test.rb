require "test_helper"

class StaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = staffs(:one)
  end

  test "should get index" do
    get staffs_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_url
    assert_response :success
  end

  test "should create staff" do
    assert_difference("Staff.count", 1) do
      post staffs_url, params: {
        staff: {
          name: "New Test Staff",
          role: "Hair Stylist",
          phone: "9876543295",
          email: "new-staff@example.com",
          salary: 25000,
          joining_date: Date.current,
          active: true
        }
      }
    end

    assert_redirected_to staff_url(Staff.last)
  end

  test "should show staff" do
    get staff_url(@staff)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_url(@staff)
    assert_response :success
  end

  test "should update staff" do
    patch staff_url(@staff), params: {
      staff: {
        name: "Updated Test Staff",
        role: "Senior Hair Stylist",
        phone: "9876543296",
        email: "updated-staff@example.com",
        salary: 30000,
        joining_date: Date.current,
        active: true
      }
    }

    assert_redirected_to staff_url(@staff)
  end

  test "should destroy staff" do
    staff = Staff.create!(
      name: "Delete Test Staff",
      role: "Hair Stylist",
      phone: "9876543297",
      email: "delete-staff@example.com",
      salary: 20000,
      joining_date: Date.current,
      active: true
    )

    assert_difference("Staff.count", -1) do
      delete staff_url(staff)
    end

    assert_redirected_to staffs_url
  end
end
