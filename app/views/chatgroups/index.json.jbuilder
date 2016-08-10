json.array!(@chatgroups) do |chatgroup|
  json.extract! chatgroup, :id, :name
  json.url chatgroup_url(chatgroup, format: :json)
end
