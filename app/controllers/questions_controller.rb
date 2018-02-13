class QuestionsController < ApplicationController
  before_action :is_authenticated?, only: [:show]
  before_action :nsfw_filter, only: [:show]

  def index
  end

  def show
    @question = Question.find_by(id: params[:id])
    @comments = @question.comments
  end

  private

  def question_params
    params.require(:question).permit(:description, :category_name)
  end

end
