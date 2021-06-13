require "test_helper"

class StaffControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_index_url
    assert_response :success
  end

  test "should get edit" do
    get staff_edit_url
    assert_response :success
  end

  test "should get show" do
    get staff_show_url
    assert_response :success
  end

  test "should get new" do
    get staff_new_url
    assert_response :success
  end
end
