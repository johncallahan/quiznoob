require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user must have a name, email and password" do
    user = User.new
    assert_not user.save
  end
end
