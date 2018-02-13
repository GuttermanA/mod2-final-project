class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :choice

  validates :user_id, uniqueness: { scope: :question_id, message: "can only answer a question once" }

  # def update_question_stats
  #   binding.pry
  #   q = self.question
  #
  #   if self.choice == q.choices.first
  #     q.choice_a_count += 1
  #   else
  #     q.choice_b_count += 1
  #   end
  #   binding.pry
  #   q.save
  # end

  def calculate_count
    stats = {}
    stats[:all] = self.class.where("question_id = ?", self.question.id).size
    stats[:choice] = {}
    stats[:choice][:count] = self.class.where("question_id = ? AND choice_id = ?", self.question.id, self.choice.id).size
    stats[:choice][:instance] = self.choice
    stats
  end

  def calculate_percent(stats)
    choice = (stats[:choice][:count]/stats[:all]) * 100
    not_choice = (100 - choice)
    percent = {}
    percent[:choice] = choice.to_s + '%'
    percent[:not_choice] = not_choice.to_s + '%'
    percent
  end


end
