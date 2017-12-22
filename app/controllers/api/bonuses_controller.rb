module Api
class BonusesController < ApplicationController
  before_action :set_user
  before_action :set_bonus, only: [:show]
  before_action :set_quiz, only: [:create]
  skip_before_filter  :verify_authenticity_token
  respond_to :json

  def show
    if @user
      render :json => @bonus
    else 
      render text: "Token failed verification", status: 422
    end
  end

  # POST /bonuses
  # POST /bonuses.json
  def create
    @bonus = Bonus.new()
    @bonus.quiz = @quiz
    @bonus.user = @user

    respond_to do |format|
      if @bonus.save
        @award = Award.new
	@award.source = @bonus
	@award.save!
	@user.hearts = @user.hearts + @quiz.points
	@user.save!

        format.json { render json: @bonus.to_json(:include => :user), status: :created }
      else
        format.json { render json: nil, status: :not_acceptable }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bonus
      @bonus = Bonus.find(params[:id])
    end

    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bonus_params
      params.permit(:quiz_id)
    end
end
end
