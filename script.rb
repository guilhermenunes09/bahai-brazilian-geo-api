puts "Olá mundo"
require 'json'
require 'unicode_utils'

def to_slug(name)
  normalized_name = UnicodeUtils.nfkd(name).gsub(/[^\x00-\x7F]/, '').downcase
  normalized_name.gsub(/[^a-z0-9]+/, '-').chomp('-')
end


clusters_data_centro_oeste = [
  { name: "Esplendor da Glória", milestone: 2, conjunto: "CO1" },
  { name: "Catalão", milestone: 2, conjunto: "CO1" },
  { name: "Uberaba", milestone: 1, conjunto: "CO1" },

  { name: "Goyazes", milestone: 2, conjunto: "CO2" },
  { name: "Pirenópolis", milestone: 1, conjunto: "CO2" },
  { name: "Núr", milestone: 2, conjunto: "CO2" },
  { name: "Cristalina", milestone: 1, conjunto: "CO2" },
  { name: "Senador Canedo", milestone: 1, conjunto: "CO2" },

  { name: "Falcão Real", milestone: 3, conjunto: "CO3" },
  { name: "Valparaíso de Goiás", milestone: 1, conjunto: "CO3" },
  { name: "Formosa", milestone: 1, conjunto: "CO3" },
  { name: "Santo Antônio do Descoberto", milestone: 3, conjunto: "CO3" },
  { name: "Luziânia", milestone: 2, conjunto: "CO3" },
  { name: "Cidade Ocidental", milestone: 1, conjunto: "CO3" },

  { name: "Sinop", milestone: 2, conjunto: "CO5" },
  { name: "Tuiuiú", milestone: 2, conjunto: "CO5" },
  { name: "Nova Mutum", milestone: 1, conjunto: "CO5" },

  { name: "Glória", milestone: 3, conjunto: "CO6" },
  { name: "Arenápolis", milestone: 2, conjunto: "CO6" },
  { name: "Cáceres", milestone: 2, conjunto: "CO6" },
  { name: "Campo Novo dos Parecis", milestone: 1, conjunto: "CO6" },

  { name: "Canto do Rouxinol", milestone: 3, conjunto: "CO7" },
  { name: "Aquidauana", milestone: 1, conjunto: "CO7" },
  { name: "São Gabriel do Oeste", milestone: 1, conjunto: "CO7" },

  { name: "Terra Dourada", milestone: 2, conjunto: "CO8" },
  { name: "Jardim", milestone: 1, conjunto: "CO8" },
  { name: "Rio Brilhante", milestone: 2, conjunto: "CO8" },

  { name: "Girassóis", milestone: 2, conjunto: "CO9" },
  { name: "Porto Nacional", milestone: 0, conjunto: "CO9" },
  { name: "Gurupi", milestone: 2, conjunto: "CO9" }
]

clusters_data_centro_oeste.each do |cluster|
  cluster[:slug] = to_slug(cluster[:name])
end

file_path = File.join(File.dirname(__FILE__), "./db/seeds/geojson_data/clusters/clusters.json")
puts "1. file_path: #{file_path.inspect}"

geojson_data = JSON.parse(File.read(file_path))
puts "2. geojson_data: #{!geojson_data.nil?}"

geojson_data.delete("name")
geojson_data.delete("crs")

max_files_to_save = 200
files_saved = 0

def file_exists?(file_path)
  File.exist?(file_path)
end

geojson_data["features"].each do |feature|
  break if files_saved >= max_files_to_save
  puts "-------------------------"
  name = feature["properties"]["nome"]
  slug = to_slug(name)
  puts feature

  # Create a new GeoJSON object with the current feature
  new_geojson = {
    "type" => "FeatureCollection",
    "features" => [feature]
  }

  if clusters_data_centro_oeste.any? { |cluster| cluster[:slug].include?(slug) }

    # Convert the new GeoJSON object to JSON
    new_geojson_json = JSON.pretty_generate(new_geojson)

    # Specify the directory or file path where you want to save the files
    file_path = "./db/seeds/geojson_data/clusters/#{slug}.json"

    if file_exists?(file_path)
      puts "#{file_path} already exists. Skipping..."
    else
      # Save the JSON to the specified file path
      File.write(file_path, new_geojson_json)
      puts "Saved #{file_path}"

      files_saved += 1
    end
  end
end



