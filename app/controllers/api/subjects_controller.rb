module Api
class SubjectsController < ApplicationController
  before_action :set_user
  before_action :set_subject, only: [:show]
  skip_before_filter  :verify_authenticity_token

  # GET /subjects
  # GET /subjects.json
  def index
    if @user
      @subjects = Subject.all
      render :json => @subjects
    else 
      render text: "Token failed verification", status: 422
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    if @user
      render :json => @subject.to_json(:include => :quizzes)
    else 
      render text: "Token failed verification", status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:id)
    end
end
end
