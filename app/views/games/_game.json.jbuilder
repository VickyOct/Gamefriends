json.extract! game, :id, :title, :genre, :platform, :short_description, :created_at, :updated_at
json.url game_url(game, format: :json)
