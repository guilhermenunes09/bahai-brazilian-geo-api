project1 = Project.find_by(id: 1)

unless project1
  puts "Project 1 not found, skipping project_legends seed."
  return
end

legends_data = [
  { name: 'Virgem',     color: '#ffffff', sort_order: 0, rules: [{ 'layer' => 'bahai_clusters', 'attribute' => 'milestone', 'value' => 'virgem' }] },
  { name: 'Incipiente', color: '#c8e6c9', sort_order: 1, rules: [{ 'layer' => 'bahai_clusters', 'attribute' => 'milestone', 'value' => 'incipient' }] },
  { name: '1º Marco',   color: '#8cfa95', sort_order: 2, rules: [{ 'layer' => 'bahai_clusters', 'attribute' => 'milestone', 'value' => 'one' }] },
  { name: '2º Marco',   color: '#4fa857', sort_order: 3, rules: [{ 'layer' => 'bahai_clusters', 'attribute' => 'milestone', 'value' => 'two' }] },
  { name: '3º Marco',   color: '#306634', sort_order: 4, rules: [{ 'layer' => 'bahai_clusters', 'attribute' => 'milestone', 'value' => 'three' }] },
  { name: 'Fronteiras', color: '#1b381d', sort_order: 5, rules: [{ 'layer' => 'bahai_clusters', 'attribute' => 'milestone', 'value' => 'frontiers' }] },
]

legends_data.each do |attrs|
  legend = project1.project_legends.find_or_initialize_by(name: attrs[:name])
  legend.assign_attributes(
    color: attrs[:color],
    sort_order: attrs[:sort_order],
    rules: attrs[:rules]
  )
  legend.save!
  puts "  Legend '#{legend.name}' #{legend.previously_new_record? ? 'created' : 'updated'}"
end

puts "ProjectLegends seeded for project 1 (#{project1.name})"
