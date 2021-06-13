require "test_helper"

class RigsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rigs_index_url
    assert_response :success
  end

  test "should get new" do
    get rigs_new_url
    assert_response :success
  end
end
