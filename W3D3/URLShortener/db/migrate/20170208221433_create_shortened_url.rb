class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :longurl, null: false
      t.string :shorturl, null: false, unique: true
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
