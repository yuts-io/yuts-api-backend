class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :comment_id
      t.integer :student_id
      t.boolean :upvote

      t.timestamps
    end
  end
end
