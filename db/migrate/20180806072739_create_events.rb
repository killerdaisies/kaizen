class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :address
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :completed
      t.integer :capacity
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
