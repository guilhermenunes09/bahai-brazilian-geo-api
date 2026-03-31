puts "Seeding Bahai Regions..."

bahai_regions_data = [
  { name: "Centro-Oeste Bahá'í", slug: "centro-oeste-bahai", file: "centro-oeste" },
]

bahai_regions_data.each do |data|
  record = BahaiRegion.find_or_initialize_by(slug: data[:slug])
  record.name = data[:name]

  file_path = File.join(File.dirname(__FILE__), "geojson_data/bahai_regions/#{data[:file]}.json")
  if File.exist?(file_path)
    record.geojson_data = JSON.parse(File.read(file_path))
    puts "  Loaded geojson for #{data[:name]}"
  else
    puts "  WARNING: geojson file not found for #{data[:name]} (#{file_path})"
  end

  record.save!
  puts "  Saved: #{record.name} (id=#{record.id})"
end

puts "Bahai Regions seeded: #{BahaiRegion.count}"
