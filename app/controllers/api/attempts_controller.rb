module Api
class AttemptsController < ApplicationController
  before_action :set_user
  before_action :set_attempt, only: [:show]
  before_action :set_result, only: [:create]
  skip_before_filter  :verify_authenticity_token
  respond_to :json

  def index
    if @user
      @attempts = Attempt.where("user_id = ${@user.id}")
      render :json => @attempts
    else
      render text: "Token failed verification", status: 422
    end
  end

  def show
    if @user
      render :json => @attempt
    else 
      render text: "Token failed verification", status: 422
    end
  end

  # POST /attempts
  # POST /attempts.json
  def create
    @attempt = Attempt.new(attempt_params.merge(:user => @user, :result => @result))

    respond_to do |format|
      if @attempt.save
        format.json { render json: @attempt, status: :created }
      else
        format.json { render json: nil, status: :not_acceptable }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    def set_result
      question = Question.find(params[:question_id])
      answer = Answer.find(params[:answer_id])
      @result = question.answer === answer
    end

    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attempt_params
      params.require(:attempt).permit(:quiz_id, :question_id, :answer_id )
    end
end
end
