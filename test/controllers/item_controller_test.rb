require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get items_index_url
    assert_response :success
  end

end
