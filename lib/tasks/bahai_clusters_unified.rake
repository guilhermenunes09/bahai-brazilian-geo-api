namespace :bahai_clusters do
  desc "Compute and store unified_geojson_data for all BahaiClusters using polygon union"
  task compute_unified: :environment do
    clusters = BahaiCluster.includes(:cities).all
    puts "Processing #{clusters.count} clusters..."

    success = 0
    skipped = 0
    failed  = 0

    clusters.each do |cluster|
      result = BahaiClusters::UnifyGeojsonService.new(cluster).call
      if result
        success += 1
        puts "  [OK]      #{cluster.name}"
      else
        skipped += 1
        puts "  [SKIP]    #{cluster.name} — no city geometry found"
      end
    rescue StandardError => e
      failed += 1
      puts "  [FAIL]    #{cluster.name} — #{e.message}"
    end

    puts "\nDone: #{success} updated, #{skipped} skipped, #{failed} failed."
  end
end
