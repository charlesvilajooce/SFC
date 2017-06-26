require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get public_team_url
    assert_response :success
  end

end
