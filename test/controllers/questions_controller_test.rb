require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @question = questions(:ninetimesnine)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { name: @question.name }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    patch :update, id: @question, question: { name: @question.name }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should not destroy question" do
    delete :destroy, id: @question
    assert_response 409
  end

  test "should destroy question" do
    @question.attempts.destroy_all
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
