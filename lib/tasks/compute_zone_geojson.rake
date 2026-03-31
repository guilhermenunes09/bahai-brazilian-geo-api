namespace :zones do
  desc "Compute geojson_data for bahai_zones by dissolving their member clusters' geometries into a single MultiPolygon"
  task compute_geojson: :environment do
    zones = BahaiZone.includes(:bahai_clusters).select { |z| z.bahai_clusters.any? }
    puts "Processing #{zones.count} zones with clusters..."

    updated = 0
    skipped = 0

    zones.each do |zone|
      multi_polygon_coords = []

      zone.bahai_clusters.each do |cluster|
        gj = cluster.geojson_data
        next unless gj.is_a?(Hash)

        features = gj["features"] || []
        next if features.empty?

        geometry = features[0]["geometry"]
        next unless geometry.is_a?(Hash)

        case geometry["type"]
        when "Polygon"
          # Polygon coords: [ [ring0], [ring1], ... ]
          # Becomes one MultiPolygon entry
          multi_polygon_coords << geometry["coordinates"]
        when "MultiPolygon"
          # MultiPolygon coords: [ [ [ring0], ... ], [ [ring0], ... ], ... ]
          # Each polygon entry gets added individually
          geometry["coordinates"].each do |polygon_coords|
            multi_polygon_coords << polygon_coords
          end
        else
          puts "  Skipping unsupported geometry type #{geometry["type"]} in cluster #{cluster.name}"
        end
      end

      if multi_polygon_coords.empty?
        puts "  Zone #{zone.name}: no valid cluster geometries, skipping"
        skipped += 1
        next
      end

      geojson = {
        "type" => "FeatureCollection",
        "features" => [
          {
            "type" => "Feature",
            "properties" => { "name" => zone.name },
            "geometry" => {
              "type" => "MultiPolygon",
              "coordinates" => multi_polygon_coords
            }
          }
        ]
      }

      zone.update_columns(geojson_data: geojson)
      puts "  Zone #{zone.name}: computed MultiPolygon with #{multi_polygon_coords.count} polygon(s)"
      updated += 1
    end

    puts ""
    puts "Done. Updated: #{updated}, Skipped: #{skipped}"
  end
end
