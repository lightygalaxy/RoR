class CreateQuizResponses < ActiveRecord::Migration
  def change
    create_table :quiz_responses do |t|
      t.references :quiz, index: true
      t.datetime :timestart
      t.datetime :timefinish
      t.integer :submitted_by

      t.timestamps
    end
  end
end
