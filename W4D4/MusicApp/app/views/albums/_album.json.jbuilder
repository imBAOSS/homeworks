json.extract! album, :id, :name, :band_id, :created_at, :updated_at
json.url album_url(album, format: :json)