require 'highline/import'
require 'awesome_print'
require 'json'

counties = ["Abbeville", "Lee", "Bamberg", "Laurens", "Newberry", "Charleston", "Beaufort", "Orangeburg", "Greenwood", "York", "Cherokee", "Barnwell", "Chester", "Dillon", "Fairfield", "Marlboro", "Union", "Darlington", "Marion", "Clarendon", "Williamsburg", "Calhoun", "Berkeley", "Georgetown", "Hampton", "Edgefield", "Spartanburg", "McCormick", "Chesterfield", "Colleton", "Florence", "Jasper", "Anderson", "Allendale", "Saluda", "Kershaw", "Oconee", "Aiken", "Sumter", "Dorchester", "Richland", "Pickens", "Horry", "Lexington", "Lancaster", "Greenville"]

county = ask "which county? type 'list' to list all counties"
ap counties.sort if county == "list"
county = ask "which county?" if county == "list"
root_path="/Users/daviddouglas/Desktop/GIS\ Data\ Archive/_South\ Carolina/DNR/topos"
`open "#{root_path}/quad_images/#{county.downcase}.gif"`
hsh = JSON.parse(File.open("#{root_path}/dnrquads.json").read)
quad = ask("which quad? (include all spaces, etc)").upcase
puts "quad: #{quad}"
quad_code = hsh[quad]
puts "quad_code: #{quad_code.downcase}"

puts "decompressing..."
fns = Dir.glob("#{root_path}/e00s/#{quad_code.downcase}*")
fn = fns[0]
ap fns
newfn = fn.split('.')[0] + '_decompressed.e00'
eval_line = "e00conv #{fn} #{newfn}"
puts "about to evaluate this: #{eval_line}"
`#{eval_line}`
puts "decompression complete. Now converting to shapefile (this will take a long time)"
Dir.mkdir "#{root_path}/shps/#{county.downcase}" unless File.exist?("#{root_path}/shps/#{county.downcase}")
eval_line = "ogr2ogr #{root_path}/shps/#{county.downcase}/#{quad.gsub(' ', '_').downcase} #{newfn}"
puts "about to evaluate this line: #{eval_line}"
`#{eval_line}`
puts "complete!"

