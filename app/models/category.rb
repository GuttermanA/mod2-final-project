class Category < ApplicationRecord
  has_many :choices
  has_many :questions
  after_create :update_slug
  before_update :assign_slug
  validates :name, uniqueness: true, presence: true

  def generate_all_questions_for_category
    id_arr = self.choices.map {|choice| choice.id}
    id_combo_arr = id_arr.combination(2).to_a
    id_combo_arr.each do |id_combo|
      q = Question.new(category_id: self.id)
      if self.name.downcase.include?('nsfw')
        q.nsfw_flag = true
      end
      choice_a = Choice.find(id_combo[0])
      choice_b = Choice.find(id_combo[1])
      q.description = "#{choice_a.name} or #{choice_b.name}"
      q.choices << choice_a
      q.choices << choice_b
      q.save
    end
    puts "Generated #{id_combo_arr.size} questions from #{self.choices.size} choices for #{self.name}"
  end

  def create_slug
    name.downcase.gsub(" ", "-")
  end

  def update_slug
    update_attributes slug: assign_slug
  end

  def to_param
    slug
  end

  def self.find_by_slug(slug)
    Category.all.find {|c| c.slug == slug}
  end

  private

  def assign_slug
    self.slug = create_slug
  end
end
