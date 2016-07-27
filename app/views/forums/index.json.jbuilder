json.array!(@forums) do |forum|
  json.extract! forum, :id, :title
  json.url forum_url(forum, format: :json)
end
