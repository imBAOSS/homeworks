json.extract! track, :id, :name, :album_id, :created_at, :updated_at
json.url track_url(track, format: :json)