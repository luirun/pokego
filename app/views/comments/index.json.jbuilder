json.array!(@comments) do |comment|
  json.extract! comment, :id, :zawartosc, :login, :id_postu
  json.url comment_url(comment, format: :json)
end
