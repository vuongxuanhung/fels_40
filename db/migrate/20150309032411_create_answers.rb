class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :correct
      t.references :word, index: true

      t.timestamps
    end
    add_index :answers, [:word_id, :created_at]
  end
end
