class RemoveCountColumnsFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :choice_a_count
    remove_column :questions, :choice_b_count
  end
end
