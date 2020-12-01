require 'test_helper'

class AllergiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get allergies_index_url
    assert_response :success
  end

  test "should get show" do
    get allergies_show_url
    assert_response :success
  end

  test "should get create" do
    get allergies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get allergies_destroy_url
    assert_response :success
  end

end
