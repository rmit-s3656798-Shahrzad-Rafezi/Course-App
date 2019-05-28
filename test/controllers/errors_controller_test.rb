require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get not_found_url
    assert_equal 404, status
  end

  test "should get internal_server_error" do
    get server_error_url
    assert_equal 500, status
  end

end
