puts "Olá mundo"
require 'json'
require 'unicode_utils'
require 'securerandom'

def to_slug(name)
  normalized_name = UnicodeUtils.nfkd(name).gsub(/[^\x00-\x7F]/, '').downcase
  normalized_name.gsub(/[^a-z0-9]+/, '-').chomp('-')
end

def file_exists?(file_path)
  File.exist?(file_path)
end

def generate_uuid
  SecureRandom.uuid
end

file_path = File.join(File.dirname(__FILE__), "./db/seeds/geojson_data/clusters/original_data/clusters.json")
nadia = JSON.parse(File.read(file_path))

array_obj = {}

nadia['features'].each do |line|
  name = to_slug(line['properties']['nome'])
  uuid = generate_uuid
  puts "Saving #{name} with UUID #{uuid}..."
  array_obj[uuid] ||= {}
  array_obj[uuid][name] = line
end

new_array_obj = JSON.pretty_generate(array_obj)

file_path = "./db/seeds/geojson_data/clusters/original_data/clusters_formatted.json"

if file_exists?(file_path)
  puts "#{file_path} already exists. Skipping..."
else
  File.write(file_path, new_array_obj)
  puts "Saved #{file_path}"
end

