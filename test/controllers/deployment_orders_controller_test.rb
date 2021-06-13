require "test_helper"

class DeploymentOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deployment_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get deployment_orders_new_url
    assert_response :success
  end
end
