require 'json'

north_region = Region.find_by(name: "Norte")
northeast_region = Region.find_by(name: "Nordeste")
midwest_region = Region.find_by(name: "Centro-Oeste")
southeast_region = Region.find_by(name: "Sudeste")
south_region = Region.find_by(name: "Sul")

states_data = [
  { name: "Mato Grosso", slug: 'mato-grosso', region: midwest_region }
]


states_data.each do |state_data|
  puts "------------------ Seeding #{state_data[:name].upcase} cities ------------------"

  # Read the GeoJSON data from the file
  file_path = File.join(File.dirname(__FILE__), "./geojson_data/#{state_data[:slug]}.json")
  geojson_data = JSON.parse(File.read(file_path))

  # Find or create the state
  state = State.find_or_create_by(name: state_data[:name])

  # Loop through each feature in the GeoJSON file
  geojson_data["features"].each do |feature|
    properties = feature["properties"]
    geometry = feature["geometry"]

    # Check if the city already exists by name
    existing_city = City.find_by(name: properties["name"])

    if existing_city
      puts "City #{existing_city.name} already exists with ID #{existing_city.id}"
    else
      # Create the city and associate it with the state
      city = City.create(
        name: properties["name"],
        geojson_data: feature,
        state: state
      )

      puts "City #{city.name} created with ID #{city.id}"
    end
  end

  puts " "
end

