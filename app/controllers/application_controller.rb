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

  def is_authenticated?
    if !current_user
      flash[:message] = 'You must be logged in to see this.'
      redirect_to signin_path
    end
  end

  def nsfw_filter
    if self.class == Answer
      filter = self.question.nsfw_flag
    elsif self.class == Question
      filter = self.nsfw_flag
    end
    if filter && (current_user.dob && current_user.dob >= 18.years.ago)
      flash[:message] = "You must be 18 or older to view this."
      redirect_to root_path
    end
  end

end
