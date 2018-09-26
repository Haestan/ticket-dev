require 'test_helper'

class StatusControllerTest < ActionDispatch::IntegrationTest
  test "should get resolved" do
    get status_resolved_url
    assert_response :success
  end

end
