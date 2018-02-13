class AddNsfwFlagColumnToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :nsfw_flag, :boolean, default: false
  end
end
