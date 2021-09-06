require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get destory" do
    get books_destory_url
    assert_response :success
  end

end
