module Api
class RewardsController < ApplicationController
  before_action :set_user
  before_action :set_reward, only: [:show]
  skip_before_filter  :verify_authenticity_token

  # GET /rewards
  # GET /rewards.json
  def index
    if @user
      @rewards = Reward.where(enabled: true)
      render :json => {rewards:@rewards,hearts:@user.hearts}.to_json
    else 
      render text: "Token failed verification", status: 422
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
    if @user
      render :json => @reward.as_json.merge({:hearts => @user.hearts})
    else 
      render text: "Token failed verification", status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_params
      params.require(:reward).permit(:id)
    end
end
end
