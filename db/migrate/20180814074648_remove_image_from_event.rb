class RemoveImageFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :imageUrl
  end
end
