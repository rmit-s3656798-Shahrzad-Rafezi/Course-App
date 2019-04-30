require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Rapid Application Development Assignment"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "courseApp | #{@base_title}"
  end

  test "should get course" do
    get courses_path
    assert_response :success
    assert_select "title", "Course | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
