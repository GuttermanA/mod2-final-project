class Question < ApplicationRecord
  has_and_belongs_to_many :choices
  belongs_to :category
  has_many :answers
  has_many :users, through: :answers
  has_many :comments

  validate :valid_choices, :unique_choice_combo

  #validations
  def valid_choices
    if self.choices.size != 2
      self.errors[:choices] << "must have two choices"
    elsif self.choices.first == self.choices.last
      self.errors[:choices] << "must have two different choices"
    end
  end

  def unique_choice_combo
    all_choices = self.class.all.map do |question|
      question.choices
    end
    ca = self.choices.first
    cb = self.choices.last
    all_choices.each do |choice_combo|
      if choice_combo.include?(ca) && choice_combo.include?(cb)
        return self.errors[:choices] << "must have unique choice combinations"
      end
    end
  end

end
