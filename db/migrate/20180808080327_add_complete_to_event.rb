class AddCompleteToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :completed, :boolean, default: false
  end
end
