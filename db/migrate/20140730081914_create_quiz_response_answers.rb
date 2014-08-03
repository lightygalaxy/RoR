class CreateQuizResponseAnswers < ActiveRecord::Migration
  def change
    create_table :quiz_response_answers do |t|
      t.references :quiz_response, index: true
      t.integer :question_id
      t.boolean :is_correct
      t.string :answer

      t.timestamps
    end
  end
end
