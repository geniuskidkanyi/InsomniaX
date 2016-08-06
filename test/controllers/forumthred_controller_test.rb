require 'test_helper'

class ForumthredControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get forumthred_index_url
    assert_response :success
  end

  test "should get show" do
    get forumthred_show_url
    assert_response :success
  end

  test "should get edit" do
    get forumthred_edit_url
    assert_response :success
  end

end
