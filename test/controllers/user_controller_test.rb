require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
      @user = User.create(username:"test", password:"password")
  end

  test "should log in" do
    get login_path
    sign_in_as(@user, "password")
    assert_response :redirect
  end

  test "should register" do
    get signup_path
    assert_template "users/new"
    post signup_path, params:{ user:{ username:"test", password:"password"} }
    assert_response :success
    assert_redirected_to root_path
  end


end
