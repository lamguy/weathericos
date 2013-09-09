require 'test_helper'

class DownloadsControllerTest < ActionController::TestCase
  test "should get free" do
    get :free
    assert_response :success
  end

  test "should get pro" do
    get :pro
    assert_response :success
  end

end
