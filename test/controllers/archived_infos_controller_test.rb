require 'test_helper'

class ArchivedInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @archived_info = archived_infos(:one)
  end

  test "should get index" do
    get archived_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_archived_info_url
    assert_response :success
  end

  test "should create archived_info" do
    assert_difference('ArchivedInfo.count') do
      post archived_infos_url, params: { archived_info: {  } }
    end

    assert_redirected_to archived_info_url(ArchivedInfo.last)
  end

  test "should show archived_info" do
    get archived_info_url(@archived_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_archived_info_url(@archived_info)
    assert_response :success
  end

  test "should update archived_info" do
    patch archived_info_url(@archived_info), params: { archived_info: {  } }
    assert_redirected_to archived_info_url(@archived_info)
  end

  test "should destroy archived_info" do
    assert_difference('ArchivedInfo.count', -1) do
      delete archived_info_url(@archived_info)
    end

    assert_redirected_to archived_infos_url
  end
end
