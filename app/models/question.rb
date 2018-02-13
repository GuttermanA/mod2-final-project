class Question < ApplicationRecord
  has_and_belongs_to_many :choices
  belongs_to :category
  has_many :answers
  has_many :users, through: :answers
  has_many :comments

  validate :valid_choices, :unique_choice_combo

  # def category_name=(name)
  #   self.category = Category.find_by(name: name)
  # end
  #
  # def category_name
  #   self.category.name
  # end

  # def self.generate_new(category:)
  #   q = self.new
  #   q.category = category
  #   q.choices = category.choices.sample(2)
  #   q.description = "#{q.choices[0].name} or #{q.choices[1].name}"
  #   q.choice_a_count = 0
  #   q.choice_b_count = 0
  #   q
  # end

  def self.generate_all_questions
    Category.all.each do |category|
      id_arr = category.choices.map {|choice| choice.id}
      id_combo_arr = id_arr.combination(2).to_a
      id_combo_arr.each do |id_combo|
        q = self.new(category_id: category.id)
        if category.name.downcase.include?('nsfw')
          q.nsfw_flag = true
        end
        choice_a = Choice.find(id_combo[0])
        choice_b = Choice.find(id_combo[1])
        q.description = "#{choice_a.name} or #{choice_b.name}"
        q.choices << choice_a
        q.choices << choice_b
        q.save
      end
    end
  end

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
