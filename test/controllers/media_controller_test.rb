require 'test_helper'

class MediaControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get media_team_url
    assert_response :success
  end

end
