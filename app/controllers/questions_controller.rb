class QuestionsController < ApplicationController
  # before_action :set_question, only: [:show]

  def index

  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:description, :category_name)
  end

  # def set_question
  #   @question = Question.find_by(id: params[:id])
  # end
end
