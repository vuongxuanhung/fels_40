class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.references :category, index: true

      t.timestamps
    end
  end
end
