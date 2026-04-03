namespace :clusters do
  desc "Recompute geojson_data for bahai_clusters by dissolving their member cities' geometries into a single MultiPolygon"
  task compute_geojson: :environment do
    clusters = BahaiCluster.includes(:cities).select { |c| c.cities.any? }
    puts "Processing #{clusters.count} clusters with cities..."

    updated = 0
    skipped = 0

    clusters.each do |cluster|
      multi_polygon_coords = []

      cluster.cities.each do |city|
        gj = city.geojson_data
        next unless gj.is_a?(Hash)

        features = gj["features"] || []
        next if features.empty?

        geometry = features[0]["geometry"]
        next unless geometry.is_a?(Hash)

        case geometry["type"]
        when "Polygon"
          multi_polygon_coords << geometry["coordinates"]
        when "MultiPolygon"
          geometry["coordinates"].each do |polygon_coords|
            multi_polygon_coords << polygon_coords
          end
        else
          puts "  Skipping unsupported geometry type #{geometry["type"]} in city #{city.name}"
        end
      end

      if multi_polygon_coords.empty?
        puts "  Cluster #{cluster.name}: no valid city geometries, skipping"
        skipped += 1
        next
      end

      geojson = {
        "type" => "FeatureCollection",
        "features" => [
          {
            "type" => "Feature",
            "properties" => { "name" => cluster.name },
            "geometry" => {
              "type" => "MultiPolygon",
              "coordinates" => multi_polygon_coords
            }
          }
        ]
      }

      cluster.update_columns(geojson_data: geojson)
      puts "  Cluster #{cluster.name}: computed MultiPolygon with #{multi_polygon_coords.count} polygon(s)"
      updated += 1
    end

    puts "\nDone. Updated: #{updated}, Skipped: #{skipped}"
  end
end
