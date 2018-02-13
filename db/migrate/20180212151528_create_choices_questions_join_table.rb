class CreateChoicesQuestionsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :choices_questions, id: false do |t|
      t.integer :question_id
      t.integer :choice_id
    end

  end
end
