class SurveyQuestionRelationshipsController < ApplicationController
  before_action :set_survey_question_relationship, only: [:show, :edit, :update, :destroy]

  def index
    @survey_question_relationships = SurveyQuestionRelationship.all
  end

  def show
  end

  def new
    @survey_question_relationship = SurveyQuestionRelationship.new
  end

  def edit
  end

  def create
    @survey_question_relationship = SurveyQuestionRelationship.new(survey_question_relationship_params)
    if @survey_question_relationship.save
      redirect_to @survey_question_relationship, notice: 'Survey Question Relationship was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @survey_question_relationship.update(survey_question_relationship_params)
      redirect_to @survey_question_relationship, notice: 'Survey Question Relationship was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @survey_question_relationship.destroy
      redirect_to survey_question_relationships_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_question_relationship
      @survey_question_relationship = SurveyQuestionRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_question_relationship_params
      params.require(:survey_question_relationship).permit(:survey_id, :question_id)
    end
end