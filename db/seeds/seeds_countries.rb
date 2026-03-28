puts "Seeding countries..."

countries_data = [
  { name: "Brasil", slug: 'brazil' },
]

countries_data.each do |country_data|

  file_path = File.join(File.dirname(__FILE__), "./geojson_data/countries/#{country_data[:slug]}.json")
  puts "check file path: #{file_path}"

  geojson_data = JSON.parse(File.read(file_path))
  puts "geojson_data #{geojson_data.class}"

  country = Country.find_or_initialize_by(name: country_data[:name])
  country.geojson_data = geojson_data
  was_new = country.new_record?
  country.save!

  action = was_new ? "Created" : "Updated"
  puts "------------------ #{action} #{country_data[:name].upcase} country ------------------"
end
