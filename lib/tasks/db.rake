namespace :db do
  desc "Destroy database and recreate it"
  task :recreate => ['db:drop', 'db:create','db:migrate'] 	

  desc "Destroy database and recreate it with data"
  task :rebuild => ['db:drop', 'db:create','db:migrate', 'db:seed'] 	
end
