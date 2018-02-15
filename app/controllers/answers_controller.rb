class AnswersController < ApplicationController
  before_action :is_authenticated?, only: [:show]
  before_action :nsfw_filter, only: [:show]

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
    @answer = Answer.new(answer_params)
    if @answer.save
      @question = @answer.question
      redirect_to question_answer_path(@question, @answer)
    else
      flash[:reanswer_message] = "You've already answered this question! Try a new one:"
      redirect_to question_path(rand_category_id)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :user_id, :choice_id)
  end
end
