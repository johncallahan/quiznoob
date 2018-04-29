require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @quiz = quizzes(:multiplication)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quizzes)
  end

  test "should have 2 quizzes" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quizzes)
    assert_equal 2, assigns(:quizzes).count
    assert_includes assigns(:quizzes).map { |q| q.name }, "Multiplication"
    assert_includes assigns(:quizzes).map { |q| q.name }, "World Map"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz" do
    assert_difference('Quiz.count') do
      post :create, quiz: { name: @quiz.name }
    end

    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should show quiz" do
    get :show, id: @quiz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz
    assert_response :success
  end

  test "should update quiz" do
    patch :update, id: @quiz, quiz: { name: @quiz.name }
    assert_redirected_to quiz_path(assigns(:quiz))
  end

  test "should not destroy quiz" do
    delete :destroy, id: @quiz
    assert_response 409
  end

  test "should destroy quiz" do
    @quiz.attempts.destroy_all
    @quiz.user_quiz.destroy_all
    assert_difference('Quiz.count', -1) do
      delete :destroy, id: @quiz
    end

    assert_redirected_to quizzes_path
  end
end
