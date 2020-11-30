require 'test_helper'

class CompoundMixesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get compound_mixes_create_url
    assert_response :success
  end

end
