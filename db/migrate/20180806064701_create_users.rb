class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :avatar_url
      t.string :wechat_name
      t.string :open_id
      t.string :city

      t.timestamps
    end
  end
end
