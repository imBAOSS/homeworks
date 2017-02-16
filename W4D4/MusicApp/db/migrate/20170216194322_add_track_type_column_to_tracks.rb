class AddTrackTypeColumnToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :track_type, :string
  end
end
