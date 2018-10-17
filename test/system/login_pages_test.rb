require "application_system_test_case"

class LoginPagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
  
    assert_equal 'undefined', User.new.name
    assert_selector "h2", text: "Log in"
  end
end
