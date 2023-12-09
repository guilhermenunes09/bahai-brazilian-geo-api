
Dir[Rails.root.join('db/seeds/**/*.rb')].sort.each do |file|
  puts "Loading seed file: #{file}"
  load file
end