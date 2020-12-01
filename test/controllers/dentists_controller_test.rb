require 'test_helper'

class DentistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dentists_index_url
    assert_response :success
  end

  test "should get show" do
    get dentists_show_url
    assert_response :success
  end

  test "should get new" do
    get dentists_new_url
    assert_response :success
  end

  test "should get create" do
    get dentists_create_url
    assert_response :success
  end

  test "should get edit" do
    get dentists_edit_url
    assert_response :success
  end

  test "should get update" do
    get dentists_update_url
    assert_response :success
  end

end
