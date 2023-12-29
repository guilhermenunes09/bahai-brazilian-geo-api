clusters_to_deactivate = [
  "chapada-dos-veadeiros",
  "goianesia",
  "porangatu",
  "uruacu",
  "vao-do-parana",
  "araguarcas",
  "barra-do-garcas-mt",
  "ipora",
  "rio-vermelho",
  "sao-miguel-do-araguaia",
  "jatai",
  "mineiros",
  "quirinopolis",
  "rio-verde",
  "formoso-do-araguaia",
  "peixe",
  "araias",
  "chapada-da-natividade",
  "dianopolis",
  "bico-do-papaguaio",
  "colinas-do-tocantins",
  "goiatins",
  "tocantinopolis",
  "ilha-do-bananal-to",
  "parque-indigena-do-xingu-mt",
  "alto-araguaia",
  "primavera-do-leste",
  "rondonopolis",
  "tesouro",
  "canarana",
  "paranatinga",
  "sao-felix-do-araguaia",
  "vila-rica",
  "alta-floresta",
  "arinos-juara",
  "aripuana",
  "juina",
  "navirai",
  "nova-andradina",
  "sete-quedas",
  "bonito",
  "corumba",
  "jardim",
  "cassilandia",
  "coxim"
]

def to_slug(name)
  normalized_name = UnicodeUtils.nfkd(name).gsub(/[^\x00-\x7F]/, '').downcase
  normalized_name.gsub(/[^a-z0-9]+/, '-').chomp('-')
end

clusters_to_deactivate.each do |cluster| 
  begin
    Cluster.find_by_slug(cluster).update(active: false)
  rescue => e
    puts "Error updating cluster #{cluster}: #{e.message}"
  end
end
