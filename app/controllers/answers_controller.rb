class AnswersController < ApplicationController
  def index
  end

  def show
    answer = Answer.find_by(id: params[:id])
  end

  def new
  end

  def create
    @answer = Answer.create(answer_params)
    @question = @answer.question
    @stats = @answer.calculate_percent(@answer.calculate_count)
    render :show
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :user_id, :choice_id)
  end
end
