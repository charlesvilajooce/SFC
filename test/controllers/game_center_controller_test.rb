require 'test_helper'

class GameCenterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_center_index_url
    assert_response :success
  end

  test "should get live" do
    get game_center_live_url
    assert_response :success
  end

  test "should get liveedit" do
    get game_center_liveedit_url
    assert_response :success
  end

end
