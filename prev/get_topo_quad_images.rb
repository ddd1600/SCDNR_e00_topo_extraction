counties = ["abbeville", "lee", "bamberg", "laurens", "newberry", "charleston", "beaufort", "orangeburg", "greenwood", "york", "cherokee", "barnwell", "chester", "dillon", "fairfield", "marlboro", "union", "darlington", "marion", "clarendon", "williamsburg", "calhoun", "berkeley", "georgetown", "hampton", "edgefield", "spartanburg", "mccormick", "chesterfield", "colleton", "florence", "jasper", "anderson", "allendale", "saluda", "kershaw", "oconee", "aiken", "sumter", "dorchester", "richland", "pickens", "horry", "lexington", "lancaster", "greenville"]
counties.each do |county|
  `wget http://www.dnr.sc.gov/GIS/img/#{county}.gif`
end