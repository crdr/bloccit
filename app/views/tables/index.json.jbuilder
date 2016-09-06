json.array!(@tables) do |table|
  json.extract! table, :id, :title, :body
  json.url table_url(table, format: :json)
end
