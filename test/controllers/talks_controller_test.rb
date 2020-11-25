require 'test_helper'

class TalksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get talks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get talks_destroy_url
    assert_response :success
  end

end
