require 'test_helper'

class SubstancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get substances_index_url
    assert_response :success
  end

  test "should get show" do
    get substances_show_url
    assert_response :success
  end

  test "should get create" do
    get substances_create_url
    assert_response :success
  end

  test "should get destroy" do
    get substances_destroy_url
    assert_response :success
  end

end
