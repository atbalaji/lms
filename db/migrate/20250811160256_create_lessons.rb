class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
