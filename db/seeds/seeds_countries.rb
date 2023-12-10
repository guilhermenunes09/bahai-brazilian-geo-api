puts "Seeding countries..."

countries_data = [
  { name: "Brasil", slug: 'brazil' },
]

countries_data.each do |country_data|

  file_path = File.join(File.dirname(__FILE__), "./geojson_data/countries/#{country_data[:slug]}.json")
  puts "check file path: #{file_path}"

  geojson_data = JSON.parse(File.read(file_path))
  puts "geojson_data #{geojson_data.class}"

  Country.find_or_create_by(name: country_data[:name]) do |country|
    puts "------------------ Seeding #{country_data[:name].upcase} country ------------------"

    country.geojson_data = geojson_data
  end
end
