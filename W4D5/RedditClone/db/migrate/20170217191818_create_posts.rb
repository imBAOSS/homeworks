class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :user_id, null: false
      t.integer :sub_id, array: true, default: []

      t.timestamps null: false
    end
    add_index :posts, [:user_id, :sub_id]
  end
end
