require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "", email: "user@invalid", password: "foo"} }
    end

    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User", email: "user.example@rmit.edu.au", password: "password13!"} }
    end

    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
