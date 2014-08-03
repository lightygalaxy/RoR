class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :question_categories do |t|
      t.string :name
      t.string :info

      t.timestamps
    end
    
    add_index :question_categories, :name,                :unique => true
    
  end
end
