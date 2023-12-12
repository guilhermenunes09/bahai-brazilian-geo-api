puts "Seeding states..."

north_region = Region.find_by(name: "Norte")
northeast_region = Region.find_by(name: "Nordeste")
midwest_region = Region.find_by(name: "Centro-Oeste")
southeast_region = Region.find_by(name: "Sudeste")
south_region = Region.find_by(name: "Sul")

_states_data = [
  { name: "Acre", slug: 'acre', region: north_region }
]

states_data = [
  { name: "Acre", slug: 'acre', region: north_region },
  { name: "Alagoas", slug: 'alagoas', region: northeast_region },
  { name: "Amapá", slug: 'amapa', region: north_region },
  { name: "Amazonas", slug: 'amazonas', region: north_region },
  { name: "Bahia", slug: 'bahia', region: northeast_region },
  { name: "Ceará", slug: 'ceara', region: northeast_region },
  { name: "Distrito Federal", slug: 'distrito-federal', region: midwest_region },
  { name: "Espírito Santo", slug: 'espirito-santo', region: southeast_region },
  { name: "Goiás", slug: 'goias', region: midwest_region },
  { name: "Maranhão", slug: 'maranhao', region: northeast_region },
  { name: "Mato Grosso", slug: 'mato-grosso', region: midwest_region },
  { name: "Mato Grosso do Sul", slug: 'mato-grosso-do-sul', region: midwest_region },
  { name: "Minas Gerais", slug: 'minas-gerais', region: southeast_region },
  { name: "Pará", slug: 'para', region: north_region },
  { name: "Paraíba", slug: 'paraiba', region: northeast_region },
  { name: "Paraná", slug: 'parana', region: south_region },
  { name: "Pernambuco", slug: 'pernambuco', region: northeast_region },
  { name: "Piauí", slug: 'piaui', region: northeast_region },
  { name: "Rio de Janeiro", slug: 'rio-de-janeiro', region: southeast_region },
  { name: "Rio Grande do Norte", slug: 'rio-grande-do-norte', region: northeast_region },
  { name: "Rio Grande do Sul", slug: 'rio-grande-do-sul', region: south_region },
  { name: "Rondônia", slug: 'rondonia', region: north_region },
  { name: "Roraima", slug: 'roraima', region: north_region },
  { name: "Santa Catarina", slug: 'santa-catarina', region: south_region },
  { name: "São Paulo", slug: 'sao-paulo', region: southeast_region },
  { name: "Sergipe", slug: 'sergipe', region: northeast_region },
  { name: "Tocantins", slug: 'tocantins', region: north_region }
]

states_data.each do |state_data|

  file_path = File.join(File.dirname(__FILE__), "./geojson_data/states/#{state_data[:slug]}.json")
  puts "check file path: #{file_path}"

  geojson_data = JSON.parse(File.read(file_path))
  puts "geojson_data #{geojson_data.class}"

  feature = geojson_data

  State.find_or_create_by(name: state_data[:name]) do |state|
    puts "------------------ Seeding #{state_data[:name].upcase} state ------------------"

    state.geojson_data = feature
    state.region = state_data[:region]
  end
end
