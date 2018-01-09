require 'test_helper'

class UsersIntegrationTest < ActionDispatch::IntegrationTest

  test "a user has a name, email and password" do
    user = User.create(name:"one",email:"#{rand(50000)}@example.com",password:"mypasswd1234")
    assert user.save
  end

end
