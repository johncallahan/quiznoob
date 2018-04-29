require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @subject = subjects(:mathematics)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject" do
    assert_difference('Subject.count') do
      post :create, subject: { name: @subject.name }
    end

    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should show subject" do
    get :show, id: @subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject
    assert_response :success
  end

  test "should update subject" do
    patch :update, id: @subject, subject: { name: @subject.name }
    assert_redirected_to subject_path(assigns(:subject))
  end

  test "should not destroy subject" do
    delete :destroy, id: @subject
    assert_response 409
  end

  test "should destroy subject" do
    @subject.quizzes.each{|q| q.attempts.destroy_all }
    @subject.quizzes.each{|q| q.user_quiz.destroy_all }
    @subject.quizzes.destroy_all
    assert_difference('Subject.count', -1) do
      delete :destroy, id: @subject
    end

    assert_redirected_to subjects_path
  end
end
