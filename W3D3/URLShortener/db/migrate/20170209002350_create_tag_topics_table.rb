class CreateTagTopicsTable < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :topics, null: false, unique: true
      t.timestamps
    end

    add_index :tag_topics, :topics
  end
end
