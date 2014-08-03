class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.boolean :shuffle, :default=> false
      t.integer :timelimit, :default=> 0
      t.integer :attempts, :default=> 0
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end
end
