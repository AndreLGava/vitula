# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ruby enconding: utf-8

today = Time.now
insemination = today + 2.days
parturition = insemination + 9.months
limit = today + 7.days
stop = insemination + 7.months

puts "Generate Profiles"
Profile.create(name: "Administrador", description: "Administrador geral do sistema")
Profile.create(name: "Agricultor", description: "Produtor rural")
