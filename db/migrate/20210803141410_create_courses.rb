class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :all_course_codes
      t.string :areas
      t.float :average_gut_rating
      t.float :average_professor
      t.float :average_rating
      t.float :average_workload
      t.float :average_rating_same_professors
      t.float :average_workload_same_professors
      
      t.timestamps
    end
  end
end
