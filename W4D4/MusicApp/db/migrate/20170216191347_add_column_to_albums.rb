class AddColumnToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :album_type, :string, null: false
  end
end
