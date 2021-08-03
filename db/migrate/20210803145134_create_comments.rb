class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :student_id
      t.text :content
      t.integer :course_id
      t.integer :vote_score

      t.timestamps
    end
  end
end
