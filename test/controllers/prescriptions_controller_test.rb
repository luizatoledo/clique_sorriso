require 'test_helper'

class PrescriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prescriptions_index_url
    assert_response :success
  end

  test "should get new" do
    get prescriptions_new_url
    assert_response :success
  end

  test "should get edit" do
    get prescriptions_edit_url
    assert_response :success
  end

end
