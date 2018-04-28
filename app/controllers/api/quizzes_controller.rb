module Api
class QuizzesController < ApplicationController
  before_action :set_user
  before_action :set_quiz, only: [:show, :unattempted]
  skip_before_filter  :verify_authenticity_token

  # GET /quizzes
  # GET /quizzes.json
  def index
    if @user
      @equizzes = []
      if params[:subject]
        if Subject.find_by_name(params[:subject])
          @quizzes = @user.quizzes.where(:subject => Subject.find_by_name(params[:subject]),:enabled => true)
	else
	  @quizzes = []
	end
      else
        @quizzes = @user.quizzes
      end
      @quizzes.each do |q|
        @equizzes << q.as_json.merge({unattempted: q.unattempted(@user).shuffle, numquestions: q.questions.count})
      end
      render :json => {quizzes:@equizzes,hearts:@user.hearts}.to_json
    else 
      render text: "Token failed verification", status: 422
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    if @user
      @unattempted = @quiz.unattempted(@user).shuffle
      render :json => @quiz.as_json.merge({unattempted: @unattempted, numquestions: @quiz.questions.count, hearts: @user.hearts})
    else 
      render text: "Token failed verification", status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:name,:subject)
    end
end
end
