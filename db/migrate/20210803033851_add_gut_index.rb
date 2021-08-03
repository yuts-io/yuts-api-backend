class AddGutIndex < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :gut_index, :float
  end
end
