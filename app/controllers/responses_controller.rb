class ResponsesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

  def index
    if :question_id
      @question = Question.find(params[:question_id])
      @responses = @question.responses
    else
      @responses = Reponse.all
    end
  end

  def show
  	@response = Response.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @response = current_user.responses.new(:question_id => params[:question_id])
  end

  def edit
  end

  def create
    @question = Question.find(params[:question_id])
    @response = current_user.responses.build(response_params)
    if @response.save
      redirect_to question_response_path(@response.question, @response), notice: 'Response was successfully created.'
    else
      render action: 'new'
    end
  end


  def update
    if @response.update(response_params)
      redirect_to question_response_path(@response.question, @response), notice: 'Response was successfully created.'
    else
      render action: 'edit'
    end
  end


  def destroy
    @response.destroy
    redirect_to responses_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:response_text, :user_id, :question_id)
    end
end