module Api
class RedemptionsController < ApplicationController
  before_action :set_user
  before_action :set_reward, only: [:create]
  skip_before_filter  :verify_authenticity_token
  respond_to :json

  # POST /redemptions
  # POST /redemptions.json
  def create
    if @user.hearts >= @reward.cost
      @redemption = Redemption.new()
      @redemption.user = @user
      @redemption.cost = @reward.cost
      @redemption.reward = @reward
      key = ENV["IFTTT_KEY"]
      url = "https://maker.ifttt.com/trigger/#{@user.account}#{@reward.event}/with/key/#{key}"
      response = RestClient.get url

      respond_to do |format|
        if response.code == 200 && @redemption.save
          @user.hearts = @user.hearts - @reward.cost
          @user.save!

          format.json { render json: @redemption.as_json(include: {reward: {only: :name}}).merge({hearts: @user.hearts}), status: :created }
        else
          format.json { render json: nil, status: :not_acceptable }
        end
      end
    else
      respond_to do |format|
        format.json { render json: {message: "Not enough hearts!"}, status: :not_acceptable }
      end
    end
  end

  private
    def set_reward
      @reward = Reward.find(params[:reward_id])
    end

    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redemption_params
      params.permit(:reward_id )
    end
end
end
