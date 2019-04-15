require 'test_helper'

class BasesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get bases_home_url
    assert_response :success
  end

  test "should get index1" do
    get bases_index1_url
    assert_response :success
  end

  test "should get index2" do
    get bases_index2_url
    assert_response :success
  end

end
