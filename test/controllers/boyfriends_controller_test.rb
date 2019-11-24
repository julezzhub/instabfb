require 'test_helper'

class BoyfriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get boyfriends_index_url
    assert_response :success
  end

  test "should get show" do
    get boyfriends_show_url
    assert_response :success
  end

  test "should get new" do
    get boyfriends_new_url
    assert_response :success
  end

  test "should get create" do
    get boyfriends_create_url
    assert_response :success
  end

end
