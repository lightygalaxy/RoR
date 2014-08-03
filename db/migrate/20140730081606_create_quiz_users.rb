class CreateQuizUsers < ActiveRecord::Migration
  def change
    create_table :quiz_users do |t|
      t.references :quiz, index: true
      t.integer :assigned_to
      t.integer :assigned_by

      t.timestamps
    end
  end
end
