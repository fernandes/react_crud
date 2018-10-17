require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "redirects to login" do
    get home_show_url
    assert_response :found
    follow_redirect!
    assert_response :success
    assert_select "h2", text: "Log in"
  end

end
