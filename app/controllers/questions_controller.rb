class QuestionsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

  def index
  	@questions = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def new
    @question = current_user.questions.build
  end

  def edit
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end


  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def destroy
    @question.destroy
    redirect_to questions_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question_text)
    end
end