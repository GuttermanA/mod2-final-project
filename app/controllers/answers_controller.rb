class AnswersController < ApplicationController
  before_action :is_authenticated?, only: [:show]
  before_action :nsfw_filter, only: [:show]

  #NOTE TO ALEX: DONT TOUCH THE METHODS
  def index
  end

  def show
    @answer = Answer.find_by(id: params[:id])
    @question = @answer.question
    @stats = @answer.calculate_percent(@answer.calculate_count)
    @comments = @question.comments
  end

  def new
  end

  def create
    @answer = Answer.create(answer_params)
    @question = @answer.question
    redirect_to question_answer_path(@question, @answer)
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :user_id, :choice_id)
  end
end
