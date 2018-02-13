class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.string :name
      t.string :content
      t.string :img_url
      t.integer :category_id
      t.timestamps
    end
  end
end
