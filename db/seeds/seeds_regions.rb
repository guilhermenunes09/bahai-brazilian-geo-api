# db/seeds/seeds_regions.rb
puts "Seeding regions..."

regions_data = [
  { name: "Norte" },
  { name: "Nordeste" },
  { name: "Centro-Oeste" },
  { name: "Sudeste" },
  { name: "Sul" }
]

regions_data.each do |region_data|
  Region.find_or_create_by(name: region_data[:name])
end
