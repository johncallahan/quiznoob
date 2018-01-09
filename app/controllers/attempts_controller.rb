class AttemptsController < ApplicationController
  before_action :set_attempt, only: [:show, :edit, :update, :destroy]
  before_action :set_result, only: [:create]

  # GET /attempts
  # GET /attempts.json
  def index
    Time.zone = "EST"
    @attempts = Attempt.all.order(id: :desc)
  end

  # GET /attempts/1
  # GET /attempts/1.json
  def show
  end

  # GET /attempts/new
  def new
    @attempt = Attempt.new
  end

  # GET /attempts/1/edit
  def edit
  end

  # POST /attempts
  # POST /attempts.json
  def create
    @attempt = Attempt.new()
    @attempt.user = @user
    @attempt.quiz = @quiz
    @attempt.question = @question
    @attempt.answer = @answer
    @attempt.result = @result

    respond_to do |format|
      if @attempt.save
        if @result
          @award = Award.new
          @award.source = @attempt
	  @award.save!
          @user.hearts = @user.hearts + @question.points
          @user.save!
        end

        format.html { redirect_to @attempt, notice: 'Attempt was successfully created.' }
        format.json { render :show, status: :created, location: @attempt }
      else
        format.html { render :new }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attempts/1
  # PATCH/PUT /attempts/1.json
  def update
    respond_to do |format|
      if @attempt.update(attempt_params)
        format.html { redirect_to @attempt, notice: 'Attempt was successfully updated.' }
        format.json { render :show, status: :ok, location: @attempt }
      else
        format.html { render :edit }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempts/1
  # DELETE /attempts/1.json
  def destroy
    @attempt.destroy
    respond_to do |format|
      format.html { redirect_to attempts_url, notice: 'Attempt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_result
      @user = User.find(attempt_params[:user_id])
      @quiz = Quiz.find(attempt_params[:quiz_id])
      @question = Question.find(attempt_params[:question_id])
      @answer = Answer.find(attempt_params[:answer_id])
      @result = @question.answer === @answer
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attempt_params
      params.require(:attempt).permit(:user_id, :quiz_id, :question_id, :answer_id )
    end
end
