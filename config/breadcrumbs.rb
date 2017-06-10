crumb :root do
  link "Início", root_path
end

crumb :animals do
  link Animal.human_attribute_name(:animals), animals_path
end

crumb :animal do |animal|
  link animal.name, animal
  parent :animals
end

crumb :donors do
  link Animal.human_attribute_name(:donors), donors_path
end

crumb :properties do
  link Property.human_attribute_name(:properties), properties_path
end

crumb :property do |property|
  link property.name, property
  parent :properties
end

crumb :lots do
  link Lot.human_attribute_name(:lots), lots_path
end

crumb :profiles do
  link Profile.human_attribute_name(:profiles), profiles_path
end

crumb :profile do |profile|
  link profile.name, profile
  parent :profiles
end

crumb :notifications do
  link Notification.human_attribute_name(:notifications), notifications_path
end

crumb :productions do
  link Production.human_attribute_name(:productions), productions_path
end

crumb :diseases do
  link Disease.human_attribute_name(:diseases), diseases_path
end

crumb :disease do |disease|
  link disease.VulgarName, disease
  parent :diseases
end

crumb :drugs do
  link Drug.human_attribute_name(:drugs), drugs_path
end

crumb :drug do |drug|
  link drug.name, drug
  parent :drugs
end

crumb :illnesses do
  link Illness.human_attribute_name(:illnesses), illnesses_path
end

crumb :illness do |illness|
  link drug.name, illness
  parent :illnesses
end

crumb :treatments do
  link Treatment.human_attribute_name(:treatments), treatments_path
end

crumb :treatment do |treatment|
  link treatment.name, treatment
  parent :treatments
end


crumb :employees do
  link Employee.human_attribute_name(:employees), employees_path
end

crumb :employee do |employee|
  link employee.name, employee
  parent :employees
end

crumb :shipments do
  link Shipment.human_attribute_name(:shipments), shipments_path
end

crumb :shipment do |shipment|
  link shipment.date, shipment
  parent :shipments
end


crumb :analyses do
  link Analysis.human_attribute_name(:analyses), analyses_path
end

crumb :analysis do |analysis|
  link analysis.codeanalysis, analysis
  parent :analyses
end

crumb :bins do
  link Bin.human_attribute_name(:bins), bins_path
end

crumb :bin do |bin|
  link "#{bin.id} - #{bin.capacity} - #{bin.kind}", bin
  parent :bins
end

crumb :stocks do
  link Stock.human_attribute_name(:stocks), stocks_path
end

crumb :stock do |stock|
  link stock.feed.name, stock
  parent :stocks
end

crumb :pasteurs do
  link Stock.human_attribute_name(:pasteurs), pasteurs_path
end

crumb :pasteur do |pasteur|
  link pasteur.feed.name, pasteur
  parent :pasteurs
end

crumb :feeds do
  link Feed.human_attribute_name(:feeds), feeds_path
end

crumb :feed do |feed|
  link feed.name, feed
  parent :feeds
end

crumb :diets do
  link Diet.human_attribute_name(:diets), diets_path
end

crumb :diet do |diet|
  link diet.name, diet
  parent :diets
end

crumb :financials do 
  link 'financials', financials_path
end

crumb :financial do |financial|
  link financial.name, financial
  parent :financials
end

crumb :schedules do 
  link 'schedules', schedules_path
end

crumb :schedule do |schedule|
  link schedule.name, schedule
  parent :schedules
end

crumb :events do 
  link 'events', events_path
end

crumb :event do |event|
  link event.name, event
  parent :events
end

crumb :batchanimals do 
  link 'batchanimals', batchanimals
end

crumb :batchanimal do |batchanimal|
  link batchanimal, batchanimal
  parent :batchanimals
end

crumb :batches do 
  link 'batches', batches_path
end

crumb :batch do |batch|
  link batch.name, batch
  parent :batches
end

crumb :services do 
  link 'services', services_path
end

crumb :feeds do
  link Feed.human_attribute_name(:feeds), feeds_path
end

crumb :service do |service|
  link service.goal, service
  parent :services
end

  


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
