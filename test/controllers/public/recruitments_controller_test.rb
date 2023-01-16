require "test_helper"

class Public::RecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_recruitments_new_url
    assert_response :success
  end

  test "should get show" do
    get public_recruitments_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_recruitments_edit_url
    assert_response :success
  end
end
