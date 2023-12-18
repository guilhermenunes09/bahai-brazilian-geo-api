# Seed data for regions
_regions_data = [
  { name: "Norte", slug: 'north' },
  { name: "Nordeste", slug: 'northeast' },
  { name: "Centro-Oeste", slug: 'central-west' },
  { name: "Sudeste", slug: 'southeast' },
  { name: "Sul", slug: 'south' }
]

regions_data = [
  { name: "Centro-Oeste", slug: 'central-west-bahai' }
]

# Seed regions
regions_data.each do |region|
  Region.find_or_create_by(name: region[:name])
end

# Seed data for zones in each region
zones_data = {
  "Centro-Oeste" => [
    { name: "CO1" },
    { name: "CO2" },
    { name: "CO3" },
    { name: "CO5" },
    { name: "CO6" },
    { name: "CO7" },
    { name: "CO8" },
    { name: "CO9" }
  ],
  "Sudeste" => [
    { name: "RJ1" },
    { name: "ES1" },
    { name: "ES2" },
    { name: "MG1" },
    { name: "MG2" },
    { name: "MG3" },
    { name: "SP1" },
    { name: "SP2" },
    { name: "SP3" },
    { name: "SP4" },
    { name: "SP5" },
    { name: "SP6" },
    { name: "SP7" },
    { name: "SP8" }
  ],
  "Norte" => [
    { name: "N1" },
    { name: "N2" },
    { name: "N3" },
    { name: "N4" },
    { name: "Isolado" }
  ],
  "Nordeste" => [
    { name: "Conjunto A" },
    { name: "Conjunto B" },
    { name: "Conjunto C" },
    { name: "Conjunto D" },
    { name: "Conjunto E" },
    { name: "Conjunto F" },
    { name: "Conjunto G" },
    { name: "Conjunto H" },
    { name: "Conjunto I" }
  ],
  "Sul" => [
    { name: "S01" },
    { name: "S02" },
    { name: "S03" },
    { name: "S04" },
    { name: "S05" },
    { name: "S06" },
    { name: "S07" }
  ]
}


regions_data.each do |region|
  puts "------------------ Seeding #{region[:name].upcase} zones ------------------"

  file_path = File.join(File.dirname(__FILE__), "./geojson_data/zones/#{region[:slug]}.json")
  geojson_data = JSON.parse(File.read(file_path))

  geojson_data["features"].each do |feature|
    
    geometry = feature["geometry"]

    existing_zone = Zone.find_by(name: feature["properties"]["nome"])

    if existing_zone
      puts "Zone #{existing_zone.name} already exists with ID #{existing_zone.id}"
    else
      zone = Zone.create(
        name: "CEO 1",
        region: Region.find_by_name(region[:name]),
        geojson_data: { 
          type: "FeatureCollection",
          features:[{
            type: "Feature",
            geometry: geometry
          }]
        }
      )

      puts "Zone #{zone.name} created with ID #{zone.id}"
    end
  end

  puts " "
end









=begin
# Seed zones for each region
regions_data.each do |region_data|
  region = Region.find_by(name: region_data[:name])
  puts "Seeding zones for #{region_data[:name]}..."
  zones_data[region_data[:name]].each do |zone_data|
    zone = region.zones.find_or_create_by(name: zone_data[:name])
    puts "  Created zone: #{zone.name}"
  end
end


"geojson_data": {
            "type": "FeatureCollection",
            "features": [
                {
                    "type": "Feature",
                    "geometry": {
=end

