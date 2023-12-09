
puts "Seeding Clusters South"
clusters_data = [
  { conjunto: "S01", clusters: ["Alvorecer da Unidade", "Tramandaí", "Porto Radiante", "Portal da Glória"] },
  { conjunto: "S02", clusters: ["Chapecó", "Luzes do Planalto", "Esplendor da Serra", "Gramado", "Sinos da Paz", "Passos de Torres"] },
  { conjunto: "S03", clusters: ["Santa Maria", "Montenegro", "Portal de Núr", "Pelotas", "Santana do Livramento"] },
  { conjunto: "S04", clusters: ["Raio de Luz", "Vale das Flores", "Piçarras", "Rio do Sul", "Brusque", "Porto do Sul", "São Bento do Sul"] },
  { conjunto: "S05", clusters: ["Pescadores de Pérolas", "Lages", "Palhoça", "Tubarão"] },
  { conjunto: "S06", clusters: ["Umuarama", "Uniflor", "Vagalume", "Estrela Brilhante", "Arapongas", "Alvorada da Paz", "Esplendor das Águas"] },
  { conjunto: "S07", clusters: ["Castro", "Campos Gerais", "Campo Largo", "Gralha Azul", "Ondas de Unidade", "Suaves Brisas", "Araucárias"] }
]

# Seed clusters
clusters_data.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."
  
  data[:clusters].each do |cluster_name|
    cluster = conjunto.clusters.find_or_create_by(name: cluster_name.strip)
    puts "  Created cluster: #{cluster.name}"
  end
end

puts "Seeding Clusters Nordeste"
clusters_data_nordeste = [
  { conjunto: "Conjunto A", clusters: ["Grande Fortaleza", "Jenipapo Kanindé", "Tapeba"] },
  { conjunto: "Conjunto B", clusters: ["Heróis de Deus", "Extremoz", "Ceará Mirim"] },
  { conjunto: "Conjunto C", clusters: ["Juarez Távora/Ingá", "Campina Grande", "Portal do Sol"] },
  { conjunto: "Conjunto D", clusters: ["Fênix", "Olinda", "Cabo de Santo Agostinho", "Camarajibe"] },
  { conjunto: "Conjunto E", clusters: ["Fulniô/Águas Belas", "Kariri-Xocó", "Xucuru-Kariri", "Karapotó"] },
  { conjunto: "Conjunto F", clusters: ["Águas da Vida", "São Miguel dos Milagres"] },
  { conjunto: "Conjunto G", clusters: ["Jardim do Ridvan", "São Cristovão", "Laranjeiras"] },
  { conjunto: "Conjunto H", clusters: ["Polo Petroquímico (Simões Filho)", "Cidade da Bahia", "Estrada de coco", "Feira de Santana", "Recôncavo Baiano", "Imbassaí"] },
  { conjunto: "Conjunto I", clusters: ["Ribeira do Pombal", "Kiriri"] }
]

# Seed clusters for Nordeste region
clusters_data_nordeste.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."
  
  data[:clusters].each do |cluster_name|
    cluster = conjunto.clusters.find_or_create_by(name: cluster_name.strip)
    puts "  Created cluster: #{cluster.name}"
  end
end

puts "Seeding Clusters Centro-Oeste"
clusters_data_centro_oeste = [
  { conjunto: "CO1", clusters: ["Esplendor da Glória", "Catalão", "Uberaba"] },
  { conjunto: "CO2", clusters: ["Goyazes", "Pirenópolis", "Núr", "Cristalina", "Senador Canedo"] },
  { conjunto: "CO3", clusters: ["Falcão Real", "Valparaíso de Goiás", "Formosa", "Santo Antônio do Descoberto", "Luziânia", "Cidade Ocidental"] },
  { conjunto: "CO5", clusters: ["Sinop", "Tuiuiú", "Nova Mutum"] },
  { conjunto: "CO6", clusters: ["Glória", "Arenápolis", "Cáceres", "Campo Novo dos Parecis"] },
  { conjunto: "CO7", clusters: ["Canto do Rouxinol", "Aquidauana", "São Gabriel do Oeste"] },
  { conjunto: "CO8", clusters: ["Terra Dourada", "Jardim", "Rio Brilhante"] },
  { conjunto: "CO9", clusters: ["Girassóis", "Porto Nacional", "Gurupi"] }
]

# Seed clusters for Centro-Oeste region
clusters_data_centro_oeste.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."
  
  data[:clusters].each do |cluster_name|
    cluster = conjunto.clusters.find_or_create_by(name: cluster_name.strip)
    puts "  Created cluster: #{cluster.name}"
  end
end

puts "Seeding Clusters Norte"
clusters_data_norte = [
  { conjunto: "N1", clusters: ["Luz", "Raio de Luz", "José de Freitas"] },
  { conjunto: "N2", clusters: ["Rouxinol do Paraíso", "Jangada de Luz", "Paço de Luz"] },
  { conjunto: "N3", clusters: ["Açai", "Mazagão"] },
  { conjunto: "N4", clusters: ["Pérola", "Luz da terra"] },
  { conjunto: "Isolado", clusters: ["Altamira"] }
]

# Seed clusters for Norte region
clusters_data_norte.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."
  
  data[:clusters].each do |cluster_name|
    cluster = conjunto.clusters.find_or_create_by(name: cluster_name.strip)
    puts "  Created cluster: #{cluster.name}"
  end
end

puts "Seeding Clusters Sudeste"
clusters_data_sudeste = [
  { conjunto: "RJ1", clusters: ["Luz da Serra", "Nova Iguaçu", "Rio de Janeiro", "Sol do Rio"] },
  { conjunto: "ES1", clusters: ["Esperança", "Espírito de Luz", "Linhares"] },
  { conjunto: "ES2", clusters: ["Anchieta", "Cachoeiro do Itapemirim", "Guarapari", "Vila Velha"] },
  { conjunto: "MG1", clusters: ["Belo Horizonte", "Cambuquira", "Lagoa Santa", "Minas de Esplendor", "Nova Lima"] },
  { conjunto: "MG2", clusters: ["Bom Despacho", "Caratinga", "Divinópolis", "Horizonte de Glória", "Sete Lagoas"] },
  { conjunto: "MG3", clusters: ["Buritizeiro", "Rio de Luz"] },
  { conjunto: "SP1", clusters: ["Fênix Dourada", "Lins", "Presidente Prudente", "Tupã"] },
  { conjunto: "SP2", clusters: ["Andradina", "Centelha da Fé", "São José do Rio Preto"] },
  { conjunto: "SP3", clusters: ["Jaboticabal", "Luz de Deus", "Sol Divino"] },
  { conjunto: "SP4", clusters: ["Estrela do Vale", "Guaratinguetá", "Guarulhos", "Luzes", "Mauá", "Sampa", "Santana de Parnaíba", "Seguidores da Glória"] },
  { conjunto: "SP5", clusters: ["Caminhos", "Indaiatuba", "Rouxinol", "Sorocaba"] },
  { conjunto: "SP6", clusters: ["Andorinhas do Reino", "Cajamar", "Campinas", "Itatiba", "Jarinu", "Jundiaí"] },
  { conjunto: "SP7", clusters: ["Alfenas", "Amparo", "Jacutinga", "Mogi Mirim", "Rio Claro", "Rio de Vida Eterna"] },
  { conjunto: "SP8", clusters: ["Irrestritos Como o Vento", "Limeira", "Piracicaba"] }
]

# Seed clusters for Sudeste region
clusters_data_sudeste.each do |data|
  conjunto = Zone.find_or_create_by(name: data[:conjunto])
  puts "Seeding clusters for #{conjunto.name}..."
  
  data[:clusters].each do |cluster_name|
    cluster = conjunto.clusters.find_or_create_by(name: cluster_name.strip)
    puts "  Created cluster: #{cluster.name}"
  end
end
