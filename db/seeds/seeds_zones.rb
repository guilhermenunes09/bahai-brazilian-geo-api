puts "Seeding zones..."

zones_data = {
  "Centro-Oeste" => ["CO1", "CO2", "CO3", "CO5", "CO6", "CO7", "CO8", "CO9"],
  "Sudeste" => ["RJ1", "ES1", "ES2", "MG1", "MG2", "MG3", "SP1", "SP2", "SP3", "SP4", "SP5", "SP6", "SP7", "SP8"],
  "Norte" => ["N1", "N2", "N3", "N4", "Isolado"],
  "Nordeste" => ["Conjunto A", "Conjunto B", "Conjunto C", "Conjunto D", "Conjunto E", "Conjunto F", "Conjunto G", "Conjunto H", "Conjunto I"],
  "Sul" => ["S01", "S02", "S03", "S04", "S05", "S06", "S07"]
}

zones_data.each do |region_name, zone_names|
  region = Region.find_by(name: region_name)

  unless region
    raise "Region '#{region_name}' not found. Run seeds_regions before seeds_zones."
  end

  puts "Seeding zones for #{region_name}..."

  zone_names.each do |zone_name|
    zone = region.zones.find_or_create_by!(name: zone_name)
    puts "  Created zone: #{zone.name}"
  end
end
