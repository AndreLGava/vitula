crumb :root do
  link "Vitula", root_path
end

crumb :animals do
  link "Animals", animals_path
end

crumb :animal do |animal|
  link animal.name, animal
  parent :animals
end

crumb :properties do
  link "Properties", properties_path
end

crumb :property do |property|
  link property.name, property
  parent :properties
end

crumb :lots do
  link "Lots", lots_path
end

crumb :profiles do
  link "Profiles", profiles_path
end

crumb :profile do |profile|
  link profile.name, profile
  parent :profiles
end

crumb :notifications do
  link "Notifications", notifications_path
end

crumb :productions do
  link "Productions", productions_path
end

crumb :diseases do
  link "Doenças", diseases_path
end

crumb :disease do |disease|
  link disease.VulgarName, disease
  parent :diseases
end

crumb :drugs do
  link "Medicamentos", drugs_path
end

crumb :drug do |drug|
  link drug.name, drug
  parent :drugs
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
