require 'test_helper'

class Api::SubjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @subject = subjects(:mathematics)
  end

  test "should get index" do
    post :index, { access_token: users(:one).access_token }
    assert_response :success
    assert_not_nil assigns(:subjects)
  end

  test "should get index with no quizzes" do
    post :index, { access_token: users(:one).access_token }
    assert_response :success
    body = JSON.parse(@response.body)
    assert_equal 0, body["subjects"].first["numquizzes"]
  end

  test "should get index with 1 quiz" do
    post :index, { access_token: users(:two).access_token }
    assert_response :success
    body = JSON.parse(@response.body)
    assert_equal 1, body["subjects"].first["numquizzes"]
  end

end
