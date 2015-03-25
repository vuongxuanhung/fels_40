class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :user, index: true
      t.references :category, index: true
      t.integer :correct_answers
      t.timestamps
    end
  end
end
