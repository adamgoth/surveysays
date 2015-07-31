class SurveysController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
  	@surveys = Survey.all
  end

  def show
  	@survey = Survey.find(params[:id])
    @responses = Response.where(survey_id: @survey.id).all
  end

  def new
    @survey = Survey.new
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render action: 'new'
    end
  end


  def update
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render action: 'show'
    end
  end


  def destroy
    @survey.destroy
    redirect_to surveys_url
  end

  def responses
    @users = User.all
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:user_id, 
                                    :question_id, 
                                    :question_ids => [],
                                    :questions_attributes => [:id, :question_text,
                                    :responses_attributes => [:id, :response_text, :user_id, :survey_id, :rating] 
                                    ])
    end
end