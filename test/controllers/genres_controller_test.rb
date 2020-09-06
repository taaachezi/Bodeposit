require 'test_helper'

class GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get genres_new_url
    assert_response :success
  end

end
