json.array!(@buildings) do |building|
	json.extract! building, :id, :street_address, :city, :state, :postal_code
	json.url building_url(building, format: :json)
end