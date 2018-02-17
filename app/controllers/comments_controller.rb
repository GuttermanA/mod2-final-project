class CommentsController < ApplicationController
  def index

  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      answer = @comment.user.answers.last
      question = @comment.question
      redirect_to answer
    else
      flash[:comment_message] = "Cannot submit empty comment."
      redirect_to controller: 'answers', action: 'show', id: @comment.user.answers.last.id, question_id: @comment.question.id
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:question_id, :user_id, :content)
  end
end
