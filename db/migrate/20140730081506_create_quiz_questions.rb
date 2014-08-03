class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.references :quiz, index: true
      t.references :question, index: true
      t.integer :marks, :default => 1

      t.timestamps
    end
  end
end
