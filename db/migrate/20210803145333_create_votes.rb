class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :comment_id
      t.integer :student_id
      t.bool :upvote

      t.timestamps
    end
  end
end
