class UserQuizzesController < ApplicationController

  # GET /user_quizzes
  # GET /user_quizzes.json
  def index
    @users = User.all
    @quizzes = Quiz.all
    @user_quizzes = UserQuiz.all
  end

  def toggle
    @quiz = Quiz.find(params[:quiz_id])
    user = User.find(params[:user_id])
    @uq = UserQuiz.where(:user => user,:quiz => @quiz)
    if @uq.count > 0
      @uq.first.destroy
    else
      userquiz = UserQuiz.create(:user => user,:quiz => @quiz)
      userquiz.save!
    end
  end

  private

end
