require 'securerandom'

puts "Seeding Clusters South"
clusters_data = [
  { name: "Alvorecer da Unidade", milestone: 1, conjunto: "S01" },
  { name: "Tramandaí", milestone: 1, conjunto: "S01" },
  { name: "Porto Radiante", milestone: 2, conjunto: "S01" },
  { name: "Portal da Glória", milestone: 1, conjunto: "S01" },

  { name: "Chapecó", milestone: 1, conjunto: "S02" },
  { name: "Luzes do Planalto", milestone: 1, conjunto: "S02" },
  { name: "Esplendor da Serra", milestone: 1, conjunto: "S02" },
  { name: "Gramado", milestone: 1, conjunto: "S02" },
  { name: "Sinos da Paz", milestone: 1, conjunto: "S02" },
  { name: "Passos de Torres", milestone: 1, conjunto: "S02" },

  { name: "Santa Maria", milestone: 1, conjunto: "S03" },
  { name: "Montenegro", milestone: 1, conjunto: "S03" },
  { name: "Portal de Núr", milestone: 1, conjunto: "S03" },
  { name: "Pelotas", milestone: 1, conjunto: "S03" },
  { name: "Santana do Livramento", milestone: 1, conjunto: "S03" },

  { name: "Raio de Luz", milestone: 1, conjunto: "S04" },
  { name: "Vale das Flores", milestone: 1, conjunto: "S04" },
  { name: "Piçarras", milestone: 1, conjunto: "S04" },
  { name: "Rio do Sul", milestone: 1, conjunto: "S04" },
  { name: "Brusque", milestone: 1, conjunto: "S04" },
  { name: "Porto do Sul", milestone: 1, conjunto: "S04" },
  { name: "São Bento do Sul", milestone: 1, conjunto: "S04" },

  { name: "Pescadores de Pérolas", milestone: 1, conjunto: "S05" },
  { name: "Lages", milestone: 1, conjunto: "S05" },
  { name: "Palhoça", milestone: 1, conjunto: "S05" },
  { name: "Tubarão", milestone: 1, conjunto: "S05" },

  { name: "Umuarama", milestone: 1, conjunto: "S06" },
  { name: "Uniflor", milestone: 1, conjunto: "S06" },
  { name: "Vagalume", milestone: 1, conjunto: "S06" },
  { name: "Estrela Brilhante", milestone: 1, conjunto: "S06" },
  { name: "Arapongas", milestone: 1, conjunto: "S06" },
  { name: "Alvorada da Paz", milestone: 1, conjunto: "S06" },
  { name: "Esplendor das Águas", milestone: 1, conjunto: "S06" },

  { name: "Castro", milestone: 1, conjunto: "S07" },
  { name: "Campos Gerais", milestone: 1, conjunto: "S07" },
  { name: "Campo Largo", milestone: 1, conjunto: "S07" },
  { name: "Gralha Azul", milestone: 3, conjunto: "S07" },
  { name: "Ondas de Unidade", milestone: 2, conjunto: "S07" },
  { name: "Suaves Brisas", milestone: 2, conjunto: "S07" },
  { name: "Araucárias", milestone: 2, conjunto: "S07" }
]

=begin

# Seed clusters
clusters_data.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."

  cluster = conjunto.clusters.find_or_create_by(
    name: data[:name].strip,
    milestone: data[:milestone]
  )

  puts "  Created cluster: #{cluster.name} (Milestone: #{cluster.milestone})"
end
=end

#---------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------#


puts "Seeding Clusters Nordeste"
clusters_data_nordeste = [
  { name: "Grande Fortaleza", milestone: 1, conjunto: "Conjunto A" },
  { name: "Jenipapo Kanindé", milestone: 1, conjunto: "Conjunto A" },
  { name: "Tapeba", milestone: 1, conjunto: "Conjunto A" },
  { name: "Ceará Mirim", milestone: 1, conjunto: "Conjunto B" },

  { name: "Heróis de Deus", milestone: 2, conjunto: "Conjunto B" },
  { name: "Extremoz", milestone: 2, conjunto: "Conjunto B" },

  { name: "Juarez Távora/Ingá", milestone: 1, conjunto: "Conjunto C" },
  { name: "Campina Grande", milestone: 1, conjunto: "Conjunto C" },
  { name: "Portal do Sol", milestone: 1, conjunto: "Conjunto C" },

  { name: "Fênix", milestone: 2, conjunto: "Conjunto D" },
  { name: "Olinda", milestone: 2, conjunto: "Conjunto D" },
  { name: "Cabo de Santo Agostinho", milestone: 2, conjunto: "Conjunto D" },
  { name: "Camarajibe", milestone: 2, conjunto: "Conjunto D" },

  { name: "Fulniô/Águas Belas", milestone: 1, conjunto: "Conjunto E" },
  { name: "Kariri-Xocó", milestone: 1, conjunto: "Conjunto E" },
  { name: "Xucuru-Kariri", milestone: 1, conjunto: "Conjunto E" },
  { name: "Karapotó", milestone: 1, conjunto: "Conjunto E" },

  { name: "Águas da Vida", milestone: 2, conjunto: "Conjunto F" },
  { name: "São Miguel dos Milagres", milestone: 2, conjunto: "Conjunto F" },

  { name: "Jardim do Ridvan", milestone: 3, conjunto: "Conjunto G" },
  { name: "São Cristovão", milestone: 3, conjunto: "Conjunto G" },
  { name: "Laranjeiras", milestone: 3, conjunto: "Conjunto G" },

  { name: "Polo Petroquímico (Simões Filho)", milestone: 1, conjunto: "Conjunto H" },
  { name: "Cidade da Bahia", milestone: 1, conjunto: "Conjunto H" },
  { name: "Estrada de coco", milestone: 1, conjunto: "Conjunto H" },
  { name: "Feira de Santana", milestone: 1, conjunto: "Conjunto H" },
  { name: "Recôncavo Baiano", milestone: 1, conjunto: "Conjunto H" },
  { name: "Imbassaí", milestone: 1, conjunto: "Conjunto H" },

  { name: "Ribeira do Pombal", milestone: 1, conjunto: "Conjunto I" },
  { name: "Kiriri", milestone: 1, conjunto: "Conjunto I" }
]

=begin
# Seed clusters
clusters_data_nordeste.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."

  cluster = conjunto.clusters.find_or_create_by(
    name: data[:name].strip,
    milestone: data[:milestone]
  )

  puts "  Created cluster: #{cluster.name} (Milestone: #{cluster.milestone})"
end
=end

#---------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------#

def to_slug(name)
  normalized_name = UnicodeUtils.nfkd(name).gsub(/[^\x00-\x7F]/, '').downcase
  normalized_name.gsub(/[^a-z0-9]+/, '-').chomp('-')
end

  puts "Seeding Clusters Centro-Oeste"
  clusters_data_centro_oeste = [
    { name: "Pirenópolis", milestone: 1, conjunto: "DF1", active: true },
    { name: "Falcão Real", milestone: 4, conjunto: "DF1", active: true },
    { name: "Cidade Ocidental", milestone: 1, conjunto: "DF1", active: true },
    { name: "Formosa", milestone: 1, conjunto: "DF1", active: true },
    { name: "Padre Bernardo", milestone: 0, conjunto: "DF1", active: true },
    { name: "Planaltina", alias: "Planaltina de Goiás", milestone: 0, conjunto: "DF1", active: true },

    { name: "Cristalina", milestone: 1, conjunto: "DF2", active: true },
    { name: "Luziânia", milestone: 2, conjunto: "DF2", active: true },
    { name: "Valparaíso", alias: "Valparaíso de Goiás", milestone: 1, conjunto: "DF2", active: true },
    { name: "Águas Lindas", alias: "Águas Lindas de Goiás", milestone: 0, conjunto: "DF2", active: true },
    { name: "Santo Antônio do Descoberto", milestone: 3, conjunto: "DF2", active: true },

    { name: "Goyazes", milestone: 3, conjunto: "GO1", active: true },
    { name: "Senador Canedo", milestone: 1, conjunto: "GO1", active: true },
    { name: "Trindade", milestone: 0, conjunto: "GO1", active: true },
    { name: "Vale do Rio dos Bois", milestone: 0, conjunto: "GO1", active: true },

    { name: "Anicuns", milestone: 0, conjunto: "GO2", active: true },
    { name: "Ceres", milestone: 0, conjunto: "GO2", active: true },
    { name: "Inhumas", milestone: 0, conjunto: "GO2", active: true },
    { name: "Itaberaí", milestone: 0, conjunto: "GO2", active: true },
    { name: "Jaraguá", milestone: 0, conjunto: "GO2", active: true },
    { name: "Núr", milestone: 2, conjunto: "GO2", active: true },

    { name: "Caldas Novas", milestone: 0, conjunto: "GO3", active: true },
    { name: "Itumbiara", milestone: 0, conjunto: "GO3", active: true },
    { name: "Morrinhos", milestone: 0, conjunto: "GO3", active: true },
    { name: "Piracanjuba", milestone: 0, conjunto: "GO3", active: true },

    { name: "Chapada dos Veadeiros", milestone: 0, conjunto: "GO4", active: false },
    { name: "Goianésia", milestone: 0, conjunto: "GO4", active: false },
    { name: "Porangatu", milestone: 0, conjunto: "GO4", active: false },
    { name: "Uruaçu", milestone: 0, conjunto: "GO4", active: false },
    { name: "Vão do Paraná", milestone: 0, conjunto: "GO4", active: false },

    { name: "Aragarças", milestone: 0, conjunto: "GO5", active: false },
    { name: "Barra do Garças", milestone: 0, conjunto: "GO5", active: false },
    { name: "Iporá", milestone: 0, conjunto: "GO5", active: false },
    { name: "Rio Vermelho", id_objeto: 55680, milestone: 0, conjunto: "GO5", active: false },
    { name: "São Miguel do Araguaia", milestone: 0, conjunto: "GO5", active: false },

    { name: "Jataí", milestone: 0, conjunto: "GO6", active: false },
    { name: "Mineiros", milestone: 0, conjunto: "GO6", active: false },
    { name: "Quirinópolis", milestone: 0, conjunto: "GO6", active: false },
    { name: "Rio Verde", milestone: 0, conjunto: "GO6", active: false },

    { name: "Esplendor da Glória", milestone: 3, conjunto: "TM1", active: true },
    { name: "Ituiutaba", milestone: 0, conjunto: "TM1", active: true },
    { name: "Catalão", milestone: 2, conjunto: "TM1", active: true },
    { name: "Ipameri", milestone: 0, conjunto: "TM1", active: true },
    { name: "Pires do Rio", milestone: 0, conjunto: "TM1", active: true },

    { name: "Araxá", milestone: 0, conjunto: "TM2", active: true },
    { name: "Frutal", milestone: 0, conjunto: "TM2", active: true },
    { name: "Patos de Minas", milestone: 0, conjunto: "TM2", active: true },
    { name: "Patrocínio", milestone: 0, conjunto: "TM2", active: true },
    { name: "Uberaba", milestone: 1, conjunto: "TM2", active: true },

    { name: "Araguacema", milestone: 0, conjunto: "TO1", active: true },
    { name: "Girassois", milestone: 3, conjunto: "TO1", active: true },
    { name: "Guaraí", milestone: 0, conjunto: "TO1", active: true },
    { name: "Miracema do Tocantins", milestone: 0, conjunto: "TO1", active: true },
    { name: "Paraíso do Tocantins", milestone: 0, conjunto: "TO1", active: true },
    { name: "Porto Nacional", milestone: 0, conjunto: "TO1", active: true },

    { name: "Formoso do Araguaia", milestone: 0, conjunto: "TO2", active: false },
    { name: "Gurupi", milestone: 2, conjunto: "TO2", active: true },
    { name: "Peixe", milestone: 0, conjunto: "TO2", active: false },

    { name: "Arraias", milestone: 0, conjunto: "TO3", active: false },
    { name: "Chapada da Natividade", milestone: 0, conjunto: "TO3", active: false },
    { name: "Dianópolis", milestone: 0, conjunto: "TO3", active: false },
    { name: "Jalapão", milestone: 0, conjunto: "TO3", active: true },

    { name: "Araguaína", milestone: 0, conjunto: "TO4", active: true },
    { name: "Bico do Papagaio", alias: "Bico do Papaguaio", milestone: 0, conjunto: "TO4", active: false },
    { name: "Colinas do Tocantins", milestone: 0, conjunto: "TO4", active: false },
    { name: "Goiatins", milestone: 0, conjunto: "TO4", active: false },
    { name: "Tocantinópolis", milestone: 0, conjunto: "TO4", active: false },

    { name: "Ilha do Bananal - TO", milestone: 0, conjunto: "INDIGENAS", active: false },
    { name: "Parque Indígena do Xingu - MT", milestone: 0, conjunto: "INDIGENAS", active: false },

    { name: "Alto Guaporé", milestone: 0, conjunto: "MT1", active: true },
    { name: "Arenápolis", milestone: 1, conjunto: "MT1", active: true },
    { name: "Campo Novo do Parecis", alias: "Campo Novo dos Parecis", milestone: 1, conjunto: "MT1", active: true },
    { name: "Glória", milestone: 4, conjunto: "MT1", active: true },
    { name: "Jauru", alias: "Jaurú", milestone: 0, conjunto: "MT1", active: true },

    { name: "Cáceres", milestone: 2, conjunto: "MT2", active: true },
    { name: "Rosário Oeste", milestone: 0, conjunto: "MT2", active: true },
    { name: "Tuiuiú", milestone: 2, conjunto: "MT2", active: true },

    { name: "Colider", alias: "Colider", milestone: 0, conjunto: "MT3", active: true },
    { name: "Nova Mutum", milestone: 1, conjunto: "MT3", active: true },
    { name: "Sinop", milestone: 3, conjunto: "MT3", active: true },
    { name: "Nobres", milestone: 0, conjunto: "MT3", active: true },

    { name: "Alto Araguaia", milestone: 0, conjunto: "MT4", active: false },
    { name: "Primavera do Leste", milestone: 0, conjunto: "MT4", active: false },
    { name: "Rondonópolis", milestone: 0, conjunto: "MT4", active: false },
    { name: "Tesouro", milestone: 0, conjunto: "MT4", active: false },

    { name: "Canarana", milestone: 0, conjunto: "MT5", active: false },
    { name: "Paranatinga", milestone: 0, conjunto: "MT5", active: false },
    { name: "São Félix do Araguaia", milestone: 0, conjunto: "MT5", active: false },
    { name: "Vila Rica", milestone: 0, conjunto: "MT5", active: false },

    { name: "Alta Floresta", milestone: 0, conjunto: "MT6", active: false },
    { name: "Arinos-Juara", milestone: 0, conjunto: "MT6", active: false },
    { name: "Aripuanã", milestone: 0, conjunto: "MT6", active: false },
    { name: "Juína", milestone: 0, conjunto: "MT6", active: false },

    { name: "Canto do Rouxinol", milestone: 3, conjunto: "MS1", active: true },
    { name: "Corguinho", milestone: 0, conjunto: "MS1", active: true },
    { name: "Paranaíba", milestone: 0, conjunto: "MS1", active: true },
    { name: "Três Lagoas", milestone: 0, conjunto: "MS1", active: true },

    { name: "Amambai", milestone: 1, conjunto: "MS2", active: true },
    { name: "Glória de Dourados", milestone: 0, conjunto: "MS2", active: true },
    { name: "Rio Brilhante", milestone: 2, conjunto: "MS2", active: true },
    { name: "Terra Dourada", milestone: 3, conjunto: "MS2", active: true },

    { name: "Naviraí", milestone: 0, conjunto: "MS3", active: false },
    { name: "Nova Andradina", milestone: 0, conjunto: "MS3", active: false },
    { name: "Ponta Porã", milestone: 1, conjunto: "MS3", active: true },
    { name: "Sete Quedas", milestone: 0, conjunto: "MS3", active: false },

    { name: "Aquidauana", milestone: 1, conjunto: "MS4", active: true },
    { name: "Bonito", milestone: 0, conjunto: "MS4", active: false },
    { name: "Corumbá", milestone: 0, conjunto: "MS4", active: false },
    { name: "Jardim", milestone: 0, conjunto: "MS4", active: true },

    { name: "Cassilândia", milestone: 0, conjunto: "MS5", active: false },
    { name: "Coxim", milestone: 0, conjunto: "MS5", active: false },
    { name: "São Gabriel do Oeste", milestone: 2, conjunto: "MS5", active: true }
  ]

  require 'unicode_utils'


  clusters_data_centro_oeste.each do |cluster|
    cluster[:slug] = to_slug(cluster[:name])
  end

  puts "__________________________________________________________________"
  folder_path = File.dirname(__FILE__) + "/geojson_data/clusters"

  Dir.glob(File.join(folder_path, "*.json")).each do |file_path|
    file_name = File.basename(file_path, ".json")

    slug, uuid = if file_name.include?("@")
      parts = file_name.split("@", 2)
      [parts[0], parts[1]]
    else
      [file_name, nil]
    end

    read_file = File.read(file_path)
    geojson_data = JSON.parse(read_file)
    feature_properties = geojson_data.dig("features", 0, "properties") || {}
    feature_objeto_id = feature_properties["id_objeto"]

    matching_clusters = clusters_data_centro_oeste.select { |cluster| cluster[:slug] == slug }
    if matching_clusters.empty?
      puts "No cluster seed match for file: #{file_name}"
      next
    end

    matching_clusters.each do |cluster|
      if cluster[:id_objeto] && feature_objeto_id && cluster[:id_objeto] != feature_objeto_id
        next
      end

      seeded_cluster = Cluster.find_or_initialize_by(slug: cluster[:slug])
      seeded_cluster.uuid ||= uuid || SecureRandom.uuid
      seeded_cluster.name = cluster[:alias] || cluster[:name]
      seeded_cluster.milestone = cluster[:milestone]
      seeded_cluster.geojson_data = geojson_data
      seeded_cluster.active = cluster.fetch(:active, true)
      seeded_cluster.save!

      puts "Saved cluster geometry: #{cluster[:slug]} (Milestone: #{cluster[:milestone]})"
    end
  end

  puts "Seeding fallback clusters for Centro-Oeste..."
  centro_oeste_region = Region.find_by(name: "Centro-Oeste")

  if centro_oeste_region.nil?
    puts "Skipping fallback clusters: Centro-Oeste region not found"
  else
    clusters_data_centro_oeste.each do |cluster|
      zone = Zone.find_or_create_by(name: cluster[:conjunto], region: centro_oeste_region)
      cluster_name = cluster[:alias] || cluster[:name]

      seeded_cluster = Cluster.find_or_initialize_by(slug: cluster[:slug])
      seeded_cluster.name = cluster_name
      seeded_cluster.slug = cluster[:slug]
      seeded_cluster.uuid ||= SecureRandom.uuid
      seeded_cluster.milestone = cluster[:milestone]
      seeded_cluster.zone = zone
      seeded_cluster.active = cluster.fetch(:active, true)
      seeded_cluster.save!
    end

    puts "Fallback Centro-Oeste clusters seeded"
  end

  puts "__________________________________________________________________"

=begin
# Seed clusters
clusters_data_centro_oeste.each do |data|

  begin
    file_path = File.join(File.dirname(__FILE__), "./geojson_data/clusters/#{data[:slug]}.json")
    read_file = File.read(file_path)
  rescue
    next
  end

  geojson_data = JSON.parse(read_file)
  
  cluster = Cluster.find_or_create_by(name: data[:name].strip) do |cluster|
    cluster.milestone = data[:milestone]
    cluster.geojson_data = geojson_data
    cluster.slug = data[:slug]
  end

  puts "  Created cluster: #{cluster.name} (Milestone: #{cluster.milestone})"
end
=end

#---------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------#


puts "Seeding Clusters Norte"
clusters_data_norte = [
  { name: "Luz", milestone: 2, conjunto: "N1" },
  { name: "Raio de Luz", milestone: 1, conjunto: "N1" },
  { name: "José de Freitas", milestone: 1, conjunto: "N1" },

  { name: "Rouxinol do Paraíso", milestone: 2, conjunto: "N2" },
  { name: "Jangada de Luz", milestone: 2, conjunto: "N2" },
  { name: "Paço de Luz", milestone: 2, conjunto: "N2" },

  { name: "Açai", milestone: 2, conjunto: "N3" },
  { name: "Mazagão", milestone: 1, conjunto: "N3" },

  { name: "Pérola", milestone: 2, conjunto: "N4" },
  { name: "Luz da Terra", milestone: 2, conjunto: "N4" },

  { name: "Altamira", milestone: 1, conjunto: "Isolado" }
]

=begin
# Seed clusters
clusters_data_norte.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."

  cluster = conjunto.clusters.find_or_create_by(
    name: data[:name].strip,
    milestone: data[:milestone]
  )

  puts "  Created cluster: #{cluster.name} (Milestone: #{cluster.milestone})"
end
=end

#---------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------#
#---------------------------------------------------------------------------------------------------#


puts "Seeding Clusters Sudeste"
clusters_data_sudeste = [
  { name: "Luz da Serra", milestone: 1, conjunto: "RJ1" },
  { name: "Nova Iguaçu", milestone: 1, conjunto: "RJ1" },
  { name: "Rio de Janeiro", milestone: 1, conjunto: "RJ1" },
  { name: "Sol do Rio", milestone: 2, conjunto: "RJ1" },

  { name: "Cachoeiro do Itapemirim", milestone: 1, conjunto: "ES2" },
  { name: "Guarapari", milestone: 1, conjunto: "ES2" },

  { name: "Cambuquira", milestone: 1, conjunto: "MG1" },
  { name: "Caratinga", milestone: 1, conjunto: "MG2" },
  { name: "Lagoa Santa", milestone: 1, conjunto: "MG1" },

  { name: "Bom Despacho", milestone: 1, conjunto: "MG2" },
  { name: "Divinópolis", milestone: 1, conjunto: "MG2" },

  { name: "Sete Lagoas", milestone: 1, conjunto: "MG2" },
  { name: "Buritizeiro", milestone: 1, conjunto: "MG3" },

  { name: "Luz da Serra", milestone: 1, conjunto: "RJ1" },
  { name: "Nova Iguaçu", milestone: 1, conjunto: "RJ1" },
  { name: "Rio de Janeiro", milestone: 1, conjunto: "RJ1" },

  { name: "Lins", milestone: 1, conjunto: "SP1" },
  { name: "Presidente Prudente", milestone: 1, conjunto: "SP1" },
  { name: "Tupã", milestone: 1, conjunto: "SP1" },

  { name: "Andradina", milestone: 1, conjunto: "SP2" },
  { name: "Centelha da Fé", milestone: 2, conjunto: "SP2" },
  { name: "São José do Rio Preto", milestone: 1, conjunto: "SP2" },

  { name: "Jaboticabal", milestone: 2, conjunto: "SP3" },
  { name: "Luz de Deus", milestone: 1, conjunto: "SP3" },
  { name: "Sol Divino", milestone: 2, conjunto: "SP3" },

  { name: "Estrela do Vale", milestone: 2, conjunto: "SP4" },
  { name: "Guaratinguetá", milestone: 1, conjunto: "SP4" },
  { name: "Guarulhos", milestone: 1, conjunto: "SP4" },
  { name: "Luzes", milestone: 1, conjunto: "SP4" },
  { name: "Mauá", milestone: 2, conjunto: "SP4" },
  { name: "Sampa", milestone: 2, conjunto: "SP4" },
  { name: "Santana de Parnaíba", milestone: 1, conjunto: "SP4" },
  { name: "Seguidores da Glória", milestone: 2, conjunto: "SP4" },

  { name: "Caminhos", milestone: 1, conjunto: "SP5" },
  { name: "Indaiatuba", milestone: 2, conjunto: "SP5" },
  { name: "Rouxinol", milestone: 2, conjunto: "SP5" },
  { name: "Sorocaba", milestone: 1, conjunto: "SP5" },

  { name: "Andorinhas do Reino", milestone: 3, conjunto: "SP6" },
  { name: "Cajamar", milestone: 1, conjunto: "SP6" },
  { name: "Campinas", milestone: 2, conjunto: "SP6" },
  { name: "Itatiba", milestone: 1, conjunto: "SP6" },
  { name: "Jarinu", milestone: 1, conjunto: "SP6" },
  { name: "Jundiaí", milestone: 2, conjunto: "SP6" },

  { name: "Alfenas", milestone: 1, conjunto: "SP7" },
  { name: "Amparo", milestone: 1, conjunto: "SP7" },
  { name: "Jacutinga", milestone: 2, conjunto: "SP7" },
  { name: "Mogi Mirim", milestone: 3, conjunto: "SP7" },
  { name: "Rio Claro", milestone: 2, conjunto: "SP7" },
  { name: "Rio de Vida Eterna", milestone: 1, conjunto: "SP7" },

  { name: "Irrestritos Como o Vento", milestone: 2, conjunto: "SP8" },
  { name: "Limeira", milestone: 1, conjunto: "SP8" },
  { name: "Piracicaba", milestone: 2, conjunto: "SP8" }
]

=begin
clusters_data_sudeste.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."

  file_path = File.join(File.dirname(__FILE__), "./geojson_data/clusters/cacoal.json")
  geojson_data = JSON.parse(File.read(file_path))

  cluster = conjunto.clusters.find_or_create_by(
    name: data[:name].strip,
    milestone: data[:milestone],
    geojson_data: geojson_data
  )

  puts "  Created cluster: #{cluster.name} (Milestone: #{cluster.milestone})"
end
=end