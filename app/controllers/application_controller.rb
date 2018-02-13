class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :remaining_questions

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def remaining_questions
    all_questions = Question.all
    user_questions = current_user.answers.map{|a| a.question}
    remaining_questions = all_questions - user_questions
  end



end
