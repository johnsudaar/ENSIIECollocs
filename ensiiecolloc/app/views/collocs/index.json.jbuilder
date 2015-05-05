json.array!(@collocs) do |colloc|
  json.extract! colloc, :id, :titre, :adresse, :size, :places, :max_people, :price
  json.url colloc_url(colloc, format: :json)
end
