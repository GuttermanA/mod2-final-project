class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :choice

  validates :user_id, uniqueness: { scope: :question_id, message: "can only answer a question once" }

  def update_question_stats
    binding.pry
    q = self.question
    
    if self.choice == q.choices.first
      q.choice_a_count += 1
    else
      q.choice_b_count += 1
    end
    q.save
  end


end
