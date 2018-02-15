class CommentsController < ApplicationController
  def index

  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      answer = @comment.user.answers.last
      question = @comment.question
      redirect_to question_answer_path(question, answer)
    else
      flash[:message] = "Cannot submit empty comment."
      render 'answers/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:question_id, :user_id, :content)
  end
end
