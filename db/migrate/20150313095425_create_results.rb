class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :lesson, index: true
      t.references :word, index: true
      t.references :answer, index: true

      t.timestamps
    end
    add_index :results, [:lesson_id, :word_id, :answer_id]
  end
end
