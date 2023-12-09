# Seed data for regions
regions_data = [
  { name: "Norte" },
  { name: "Nordeste" },
  { name: "Centro-Oeste" },
  { name: "Sudeste" },
  { name: "Sul" }
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

# Seed zones for each region
regions_data.each do |region_data|
  region = Region.find_by(name: region_data[:name])
  puts "Seeding zones for #{region_data[:name]}..."
  zones_data[region_data[:name]].each do |zone_data|
    zone = region.zones.find_or_create_by(name: zone_data[:name])
    puts "  Created zone: #{zone.name}"
  end
end
