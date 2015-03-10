class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.references :word, index: true
      t.boolean :correct

      t.timestamps
    end
    add_index :answers, [:word_id, :created_at]
  end
end
