namespace :bahai_zones do
  desc "Compute and store unified_geojson_data for all BahaiZones using polygon union"
  task compute_unified: :environment do
    zones = BahaiZone.includes(bahai_clusters: :cities).all
    puts "Processing #{zones.count} zones..."

    success = 0
    skipped = 0
    failed  = 0

    zones.each do |zone|
      result = BahaiZones::UnifyGeojsonService.new(zone).call
      if result
        success += 1
        puts "  [OK]      #{zone.name}"
      else
        skipped += 1
        puts "  [SKIP]    #{zone.name} — no city geometry found"
      end
    rescue StandardError => e
      failed += 1
      puts "  [FAIL]    #{zone.name} — #{e.message}"
    end

    puts "\nDone: #{success} updated, #{skipped} skipped, #{failed} failed."
  end
end
