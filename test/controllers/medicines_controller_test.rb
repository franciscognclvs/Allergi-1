require 'test_helper'

class MedicinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medicines_index_url
    assert_response :success
  end

  test "should get show" do
    get medicines_show_url
    assert_response :success
  end

  test "should get create" do
    get medicines_create_url
    assert_response :success
  end

  test "should get destroy" do
    get medicines_destroy_url
    assert_response :success
  end

end
