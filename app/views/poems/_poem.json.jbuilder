json.extract! poem, :id, :poem_kid, :text, :created_at, :updated_at
json.url poem_url(poem, format: :json)
