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
    @answer.update_question_stats
    @question = @answer.question
    render :show
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :user_id, :choice_id)
  end
end
