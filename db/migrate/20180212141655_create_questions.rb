class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :description
      t.integer :category_id
      t.integer :choice_a_count
      t.integer :choice_b_count
      t.timestamps
    end
  end
end
