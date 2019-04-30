require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "courseApp"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title} | Rapid Application Development Assignment"
  end

  test "should get course" do
    get courses_path
    assert_response :success
    assert_select "title", "#{@base_title} | Course"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "#{@base_title} | Contact"
  end

end
