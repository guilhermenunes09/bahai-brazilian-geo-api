
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


puts "Seeding Clusters Centro-Oeste"
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

require 'unicode_utils'

def to_slug(name)
  normalized_name = UnicodeUtils.nfkd(name).gsub(/[^\x00-\x7F]/, '').downcase
  normalized_name.gsub(/[^a-z0-9]+/, '-').chomp('-')
end

clusters_data_centro_oeste.each do |cluster|
  cluster[:slug] = to_slug(cluster[:name])
end

# Seed clusters
clusters_data_centro_oeste.each do |data|

  file_path = File.join(File.dirname(__FILE__), "./geojson_data/clusters/#{data[:slug]}.json")
  begin
    read_file = File.read(file_path)
    geojson_data = JSON.parse(read_file)
    conjunto = Zone.find_or_create_by(name: data[:conjunto])
    puts "Seeding clusters for #{conjunto.name}..."


    cluster = conjunto.clusters.find_or_create_by(
      name: data[:name].strip,
      milestone: data[:milestone],
      geojson_data: geojson_data
    )

    puts "  Created cluster: #{cluster.name} (Milestone: #{cluster.milestone})"
  rescue Errno::ENOENT => e
    puts "error >>>>: #{e}"
  end
end


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