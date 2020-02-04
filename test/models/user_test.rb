require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(username:"test", password:"password")
  end

  test "username should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

end
