# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ruby enconding: utf-8

puts "Generate Profiles"
Profile.create(name: "Administrador", description: "Administrador geral do sistema")
Profile.create(name: "Agricultor", description: "Produtor rural")

puts "Generate Properties"
Property.create(name: "Propriedade de teste", description: "Propriedade rural de produção leitera", long: 25.9422996, lat: -58.6004562)
Property.create(name: "Propriedade Gava", description: "Propriedade rural de produção leitera gava", long: 26.9422996, lat: -53.6004562)

puts "Generate Lots"
Lot.create(name: "Novilhos", description: "Novilhos Machos para abate", property_id: 1)
Lot.create(name: "Novilhas", description: "Novilhas de 9 meses até 18 meses", property_id: 1)
Lot.create(name: "Bezerros", description: "Animais de 0 até 9 meses de idade", property_id: 1)
Lot.create(name: "Novilhos", description: "Novilhos Machos para abate", property_id: 2)
Lot.create(name: "Novilhas", description: "Novilhas de 9 meses até 18 meses", property_id: 2)
Lot.create(name: "Vacas Leiteiras", description: "Vacas Leiteiras em produção", property_id: 2)
Lot.create(name: "Bezerros", description: "Animais de 0 até 9 meses de idade", property_id: 2)

puts "Generate Animals"
Animal.create(code: 156455, name: "Mimosa", description: "Vaca holandeza de grande porte", female: true, breed: "Holandesa", lot_id: 6)
Animal.create(code: 156455, name: "Destructor", description: "Touro da propreidade", female: false, breed: "Holandesa")
Animal.create(code: 158755, name: "Bilasa", description: "Vaca jersey de pequeno porte", female: true, breed: "Jersey", lot_id: 6, reproduction_id: 1)
Animal.create(code: 155485, name: "Boneca", description: "Proveniente de propriedade externa, adquirida no passado", female: true, breed: "Holandesa", lot_id: 6, reproduction_id: 1)
Animal.create(code: 345552, name: "Pequena", description: "Vaca holandeza de grande porte", female: true, breed: "Holandesa", lot_id: 6, reproduction_id: 1)
Animal.create(code: 544546, name: "Laranja", description: "Vaca holandeza de grande porte", female: true, breed: "Holandesa", lot_id: 6, reproduction_id: 1)

puts "Generates Reproduction"
Reproduction.create( heat: 2016-05-22, father_id: 2, mother_id: 1)
