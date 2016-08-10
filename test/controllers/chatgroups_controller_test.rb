require 'test_helper'

class ChatgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatgroup = chatgroups(:one)
  end

  test "should get index" do
    get chatgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_chatgroup_url
    assert_response :success
  end

  test "should create chatgroup" do
    assert_difference('Chatgroup.count') do
      post chatgroups_url, params: { chatgroup: { name: @chatgroup.name } }
    end

    assert_redirected_to chatgroup_url(Chatgroup.last)
  end

  test "should show chatgroup" do
    get chatgroup_url(@chatgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_chatgroup_url(@chatgroup)
    assert_response :success
  end

  test "should update chatgroup" do
    patch chatgroup_url(@chatgroup), params: { chatgroup: { name: @chatgroup.name } }
    assert_redirected_to chatgroup_url(@chatgroup)
  end

  test "should destroy chatgroup" do
    assert_difference('Chatgroup.count', -1) do
      delete chatgroup_url(@chatgroup)
    end

    assert_redirected_to chatgroups_url
  end
end
