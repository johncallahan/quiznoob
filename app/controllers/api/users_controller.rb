module Api
  class UsersController < ApplicationController
    include ActionView::Helpers::DateHelper
    before_action :set_user, only: [:index, :show]
    skip_before_filter  :verify_authenticity_token

    def index
      if @user
        render :json => User.all.order(hearts: :desc).as_json(:only => [:id,:name,:hearts])
      else 
        render text: "Token failed verification", status: 422
      end
    end

    # GET /users/1
    def show
      if @user
        @redemptions = Redemption.where("redemptions.user_id = " + @user.id.to_s + " AND redemptions.created_at > '" + DateTime.now.in_time_zone("EST").beginning_of_day.in_time_zone(Time.zone).strftime("%Y-%m-%d %H:%M:%S") + "'").order(created_at: :desc).map{|x| {:id => x.id, :cost => x.cost, :name => x.reward.name, :created_at => distance_of_time_in_words(DateTime.now,x.created_at)+" ago"}}
        render :json => @user.as_json(:only => [:id,:name,:hearts]).merge({redemptions: @redemptions})
      else 
        render text: "Token failed verification", status: 422
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find_by(access_token: params[:access_token])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit()
      end

  end
end
