class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :remaining_questions, :select_unanswered_question, :select_unanswered_question_by_category, :clean_categories, :nsfw_categories, :rand_category_id

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_authenticated?
    if !current_user
      flash[:login_message] = "You must be logged in to see this."
      redirect_to login_path
    end
  end

  def remaining_questions
    all_questions = Question.all
    user_questions = current_user.answers.map{|a| a.question}
    remaining_questions = all_questions - user_questions
  end

  def select_unanswered_question
    remaining_questions.sample
  end

  # call on a category
  def select_unanswered_question_by_category(category_id)
    questions = remaining_questions.select do |q|
      q.category.id == category_id.to_i
    end
    questions.sample
  end

  def clean_categories
    Category.all.select {|c| !c.name.include?("nsfw")}
  end

  def nsfw_categories
    Category.all.select {|c| c.name.include?("nsfw")}
  end

  def rand_category_id
    rand(1..Category.all.size)
  end

  # call on an answer or question
  def nsfw_filter
    if self.class == AnswersController
      answer = Answer.find_by(id: params[:id])
      if answer.question.nsfw_flag
        filter = true
      end
    elsif self.class == QuestionsController
      category= Category.find_by(id: params[:id])
      if category.name.include?("nsfw")
        filter = true
      end
    end
    if filter && (current_user.dob && current_user.dob >= 18.years.ago)
      flash[:age_message] = "You must be 18 or older to view this."
      redirect_to root_path
    end
  end

end
