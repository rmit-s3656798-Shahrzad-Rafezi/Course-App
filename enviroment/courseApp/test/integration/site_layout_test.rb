require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", contact_path
    get root_path
    assert_select "title", full_title("Home")
    get signup_path
    assert_select "title", full_title("Sign up")
    get contact_path
    assert_select "title", full_title("Contact")
  end

end