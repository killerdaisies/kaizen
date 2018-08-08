class RemoveCompletedFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :completed
  end
end
