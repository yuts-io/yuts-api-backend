class CreateUserRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_ratings do |t|
      t.integer :course_id
      t.integer :student_id
      t.integer :difficulty_rating
      t.string :grade
      t.boolean :is_a_gut
      t.boolean :enjoyed_class

      t.timestamps
    end
  end
end
