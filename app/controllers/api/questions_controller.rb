module Api
class QuestionsController < ApplicationController
  before_action :set_user
  before_action :set_question, only: [:show, :unattempted]
  skip_before_filter  :verify_authenticity_token

  # GET /questions/1
  # GET /questions/1.json
  def show
    if @user
      @answers = @question.answers.shuffle
      @equestion = @question.as_json.merge({:answers => @answers, :hearts => @user.hearts})
      render :json => @equestion
    else 
      render text: "Token failed verification", status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit()
    end
end
end
