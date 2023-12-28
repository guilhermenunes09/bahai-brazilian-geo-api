puts "Olá mundo"
require 'json'
require 'unicode_utils'

def to_slug(name)
  normalized_name = UnicodeUtils.nfkd(name).gsub(/[^\x00-\x7F]/, '').downcase
  normalized_name.gsub(/[^a-z0-9]+/, '-').chomp('-')
end


clusters_data_centro_oeste = [
  { name: "Falcão Real", milestone: 0, conjunto: "DF1" },
  { name: "Planaltina de Goiás", milestone: 0, conjunto: "DF1" },
  { name: "Padre Bernardo", milestone: 0, conjunto: "DF3" },
  { name: "Trindade", milestone: 0, conjunto: "GO1" },
  { name: "Vale do Rio dos Bois", milestone: 0, conjunto: "GO1" },
  { name: "Anicuns", milestone: 0, conjunto: "GO2" },
  { name: "Ceres", milestone: 0, conjunto: "GO2" },
  { name: "Inhumas", milestone: 0, conjunto: "GO2" },
  { name: "Itaberaí", milestone: 0, conjunto: "GO2" },
  { name: "Jaraguá", milestone: 0, conjunto: "GO2" },
  { name: "Caldas Novas", milestone: 0, conjunto: "GO3" },
  { name: "Itumbiara", milestone: 0, conjunto: "GO3" },
  { name: "Morrinhos", milestone: 0, conjunto: "GO3" },
  { name: "Piracanjuba", milestone: 0, conjunto: "GO3" },
  { name: "Chapada dos Veadeiros", milestone: 0, conjunto: "GO4" },
  { name: "Goianésia", milestone: 0, conjunto: "GO4" },
  { name: "Porangatu", milestone: 0, conjunto: "GO4" },
  { name: "Uruaçu", milestone: 0, conjunto: "GO4" },
  { name: "Vão do Paraná", milestone: 0, conjunto: "GO4" },
  { name: "Araguarças", milestone: 0, conjunto: "GO5" },
  { name: "Barra do Garças - MT", milestone: 0, conjunto: "GO5" },
  { name: "Iporá", milestone: 0, conjunto: "GO5" },
  { name: "Rio Vermelho", milestone: 0, conjunto: "GO5" },
  { name: "São Miguel do Araguaia", milestone: 0, conjunto: "GO5" },
  { name: "Jataí", milestone: 0, conjunto: "GO6" },
  { name: "Mineiros", milestone: 0, conjunto: "GO6" },
  { name: "Quirinópolis", milestone: 0, conjunto: "GO6" },
  { name: "Rio Verde", milestone: 0, conjunto: "GO6" },
  { name: "Ituiutaba", milestone: 0, conjunto: "TM1" },
  { name: "Ipameri - GO", milestone: 0, conjunto: "TM1" },
  { name: "Pires do Rio - GO", milestone: 0, conjunto: "TM1" },
  { name: "Araxá", milestone: 0, conjunto: "TM2" },
  { name: "Frutal", milestone: 0, conjunto: "TM2" },
  { name: "Patos de Minas", milestone: 0, conjunto: "TM2" },
  { name: "Patrocínio", milestone: 0, conjunto: "TM2" },
  { name: "Araguacema", milestone: 0, conjunto: "TO1" },
  { name: "Guaraí", milestone: 0, conjunto: "TO1" },
  { name: "Miracema do Tocantins", milestone: 0, conjunto: "TO1" },
  { name: "Paraíso do Tocantins", milestone: 0, conjunto: "TO1" },
  { name: "Porto Nacional", milestone: 0, conjunto: "TO1" },
  { name: "Formoso do Araguaia", milestone: 0, conjunto: "TO2" },
  { name: "Peixe", milestone: 0, conjunto: "TO2" },
  { name: "Arraias", milestone: 0, conjunto: "TO3" },
  { name: "Chapada da Natividade", milestone: 0, conjunto: "TO3" },
  { name: "Dianópolis", milestone: 0, conjunto: "TO3" },
  { name: "Jalapão", milestone: 0, conjunto: "TO3" },
  { name: "Araguaína", milestone: 0, conjunto: "TO4" },
  { name: "Bico do Papaguaio", milestone: 0, conjunto: "TO4" },
  { name: "Colinas do Tocantins", milestone: 0, conjunto: "TO4" },
  { name: "Goiatins", milestone: 0, conjunto: "TO4" },
  { name: "Tocantinópolis", milestone: 0, conjunto: "TO4" },
  { name: "Ilha do Bananal - TO", milestone: 0, conjunto: "INDIGENAS" },
  { name: "Parque Indígena do Xingu - MT", milestone: 0, conjunto: "INDIGENAS" },
  { name: "Alto Guaporé", milestone: 0, conjunto: "MT1" },
  { name: "Jaurú", milestone: 0, conjunto: "MT1" },
  { name: "Rosário Oeste", milestone: 0, conjunto: "MT2" },
  { name: "Tuiuiú", milestone: 0, conjunto: "MT2" },
  { name: "Alto Araguaia", milestone: 0, conjunto: "MT4" },
  { name: "Primavera do Leste", milestone: 0, conjunto: "MT4" },
  { name: "Rondonópolis", milestone: 0, conjunto: "MT4" },
  { name: "Tesouro", milestone: 0, conjunto: "MT4" },
  { name: "Canarana", milestone: 0, conjunto: "MT5" },
  { name: "Paranatinga", milestone: 0, conjunto: "MT5" },
  { name: "São Félix do Araguaia", milestone: 0, conjunto: "MT5" },
  { name: "Vila Rica", milestone: 0, conjunto: "MT5" },
  { name: "Alta Floresta", milestone: 0, conjunto: "MT6" },
  { name: "Arinos-Juara", milestone: 0, conjunto: "MT6" },
  { name: "Aripuanã", milestone: 0, conjunto: "MT6" },
  { name: "Juína", milestone: 0, conjunto: "MT6" },
  { name: "Corguinho", milestone: 0, conjunto: "MS1" },
  { name: "Paranaíba", milestone: 0, conjunto: "MS1" },
  { name: "Três Lagoas", milestone: 0, conjunto: "MS1" },
  { name: "Amambai", milestone: 0, conjunto: "MS2" },
  { name: "Glória de Dourados", milestone: 0, conjunto: "MS2" },
  { name: "Naviraí", milestone: 0, conjunto: "MS3" },
  { name: "Nova Andradina", milestone: 0, conjunto: "MS3" },
  { name: "Ponta Porã", milestone: 0, conjunto: "MS3" },
  { name: "Sete Quedas", milestone: 0, conjunto: "MS3" },

  { name: "Aquidauana", milestone: 1, conjunto: "MS4" },
  { name: "Arenápolis", milestone: 1, conjunto: "MT1" },
  { name: "Campo Novo dos Parecis", milestone: 1, conjunto: "MT1" },
  { name: "Cidade Ocidental", milestone: 1, conjunto: "DF1" },
  { name: "Cristalina", milestone: 1, conjunto: "DF2" },
  { name: "Formosa", milestone: 1, conjunto: "DF1" },
  { name: "Nova Mutum", milestone: 1, conjunto: "DF1" },
  { name: "Pirenópolis", milestone: 1, conjunto: "DF3" },
  { name: "Senador Canedo", milestone: 1, conjunto: "GO1" },
  { name: "Uberaba", milestone: 1, conjunto: "TM2" },
  { name: "Valparaíso de Goiás", milestone: 1, conjunto: "DF2" },

  { name: "Cáceres", milestone: 2, conjunto: "MT2" },
  { name: "Catalão", milestone: 2, conjunto: "TM1" },
  { name: "Girassois", milestone: 2, conjunto: "TO1" },
  { name: "Gurupi", milestone: 2, conjunto: "TO2" },
  { name: "Luziânia", milestone: 2, conjunto: "DF2" },
  { name: "Núr", milestone: 2, conjunto: "GO2" },
  { name: "Rio Brilhante", milestone: 2, conjunto: "MS2" },
  { name: "Santo Antônio do Descoberto", milestone: 2, conjunto: "DF3" },
  { name: "São Gabriel do Oeste", milestone: 2, conjunto: "MS5" },

  { name: "Glória", milestone: 3, conjunto: "MT1" },
  { name: "Canto do Rouxinol", milestone: 3, conjunto: "MS1" },
  { name: "Esplendor da Glória", milestone: 3, conjunto: "TM1" },
  { name: "Goyazes", milestone: 3, conjunto: "GO1" },
  { name: "Terra Dourada", milestone: 3, conjunto: "MS2" },
  { name: "Sinop", milestone: 3, conjunto: "MT3" },

  { name: "Bonito", milestone: 0, conjunto: "MS4" },
  { name: "Corumbá", milestone: 0, conjunto: "MS4" },
  { name: "Jardim", milestone: 0, conjunto: "MS4" },
  { name: "Cassilândia", milestone: 0, conjunto: "MS5" },
  { name: "Coxim", milestone: 0, conjunto: "MS5" }
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



