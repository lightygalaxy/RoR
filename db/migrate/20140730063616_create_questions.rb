class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.references :category, index: true
      t.string :questionText
      t.string :image
      t.integer :qtype, :default => "0"
      t.string :possible_values, :default => "none"
      t.string :version, :default => "1"
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end
end
