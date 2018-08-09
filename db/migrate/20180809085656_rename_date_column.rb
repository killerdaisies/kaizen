class RenameDateColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :start_time, :start
    rename_column :events, :end_time, :end
  end
end
