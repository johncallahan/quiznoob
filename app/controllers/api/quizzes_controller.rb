module Api
class QuizzesController < ApplicationController
  before_action :set_user
  before_action :set_quiz, only: [:show, :unattempted]
  skip_before_filter  :verify_authenticity_token

  # GET /quizzes
  # GET /quizzes.json
  def index
    if @user
      if params[:subject]
        if Subject.find_by_name(params[:subject])
          @quizzes = Subject.find_by_name(params[:subject]).quizzes
	else
	  @quizzes = []
	end
      else
        @quizzes = Quiz.all
      end
      render :json => @quizzes
    else 
      render text: "Token failed verification", status: 422
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    if @user
      render :json => @quiz.as_json.merge({unattempted: @quiz.unattempted(@user)})
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
