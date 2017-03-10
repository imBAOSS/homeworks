json.extract! @pokemon, :id, :name, :attack, :defense
json.image_url asset_path(@pokemon.image_url)
json.extract! @pokemon, :moves, :poke_type, :items
