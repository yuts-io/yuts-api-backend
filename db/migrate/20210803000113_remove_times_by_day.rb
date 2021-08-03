class RemoveTimesByDay < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :times_by_day
  end
end
