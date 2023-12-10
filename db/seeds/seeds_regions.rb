# db/seeds/seeds_regions.rb
puts "Seeding regions..."

regions_data = [
  { name: "Norte", slug: 'north' },
  { name: "Nordeste", slug: 'northeast' },
  { name: "Centro-Oeste", slug: 'central-west' },
  { name: "Sudeste", slug: 'southeast' },
  { name: "Sul", slug: 'south' }
]

regions_data.each do |region_data|
  file_path = File.join(File.dirname(__FILE__), "./geojson_data/regions/#{region_data[:slug]}.json")
  puts "check file path: #{file_path}"

  geojson_data = JSON.parse(File.read(file_path))
  puts "geojson_data #{geojson_data.class}"

  Region.find_or_create_by(name: region_data[:name]) do |region| 
    puts "------------------ Seeding #{region_data[:name].upcase} region ------------------"
    region.geojson_data = geojson_data
  end
end
