class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :remaining_questions, :select_unanswered_question, :select_unanswered_question_by_category, :clean_categories, :nsfw_categories, :rand_category_id, :rand_slug, :find_user_answer

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_authenticated?
    if !current_user
      flash[:login_message] = "You must be logged in to see this."
      redirect_to login_path
    end
  end

  def find_user_answer(question)
    Answer.find_by(user_id: current_user.id, question_id: question.id)
  end

  def remaining_questions
    if current_user.dob && current_user.dob >= 18.years.ago
      all_questions = clean_categories.map {|c| c.questions}
      all_questions.flatten!
    else
      all_questions = Question.all
    end
    user_questions = current_user.answers.map{|a| a.question}
    remaining_questions = all_questions - user_questions
  end

  def select_unanswered_question
    remaining_questions.sample
  end

  # call on a category
  def select_unanswered_question_by_category(slug)
    questions = remaining_questions.select do |q|
      # q.category.id == category_id.to_i
      q.category.slug == slug
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
    if current_user.dob && current_user.dob >= 18.years.ago
      clean_categories_ids = clean_categories.map { |c| c.id  }
      clean_categories_ids.sample
    else
      rand(1..Category.all.size)
    end
  end

  def rand_slug
    Category.find(rand_category_id).slug
  end

  # call on an answer or question
  def nsfw_filter
    if self.class == AnswersController
      answer = Answer.find_by(id: params[:id])
      if answer.question.nsfw_flag
        filter = true
      end
    elsif self.class == QuestionsController
      category= Category.find_by_slug(params[:id])
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
