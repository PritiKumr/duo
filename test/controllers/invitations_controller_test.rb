require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get send" do
    get invitations_send_url
    assert_response :success
  end

end
