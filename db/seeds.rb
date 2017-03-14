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

puts "Generate Properties"
Property.create(name: "Propriedade de teste", description: "Propriedade rural de produção leitera", long: 25.9422996, lat: -58.6004562, user_id: 1)
Property.create(name: "Propriedade Gava", description: "Propriedade rural de produção leitera gava", long: 26.9422996, lat: -53.6004562, user_id: 1)

puts "Generate Lots"
Lot.create(name: "Novilhos", description: "Novilhos Machos para abate", property_id: 1)
Lot.create(name: "Novilhas", description: "Novilhas de 9 meses até 18 meses", property_id: 1)
Lot.create(name: "Bezerros", description: "Animais de 0 até 9 meses de idade", property_id: 1)
Lot.create(name: "Novilhos", description: "Novilhos Machos para abate", property_id: 2)
Lot.create(name: "Novilhas", description: "Novilhas de 9 meses até 18 meses", property_id: 2)
Lot.create(name: "Vacas Leiteiras", description: "Vacas Leiteiras em produção", property_id: 2)
Lot.create(name: "Bezerros", description: "Animais de 0 até 9 meses de idade", property_id: 2)

puts "Generate Animals"
Animal.create(code: 156455, name: "Mimosa", description: "Vaca holandeza de grande porte", female: true, breed: 1 , lot_id: 6, user_id: 1)
Animal.create(code: 156455, name: "Destructor", description: "Touro da propreidade", female: false, breed: 1 , user_id: 1)
Animal.create(code: 158755, name: "Bilasa", description: "Vaca jersey de pequeno porte", female: true, breed: 1 , lot_id: 6, reproduction_id: 1, user_id: 1)
Animal.create(code: 155485, name: "Boneca", description: "Proveniente de propriedade externa, adquirida no passado", female: true, breed: 1 , lot_id: 6, reproduction_id: 1, user_id: 1)
Animal.create(code: 345552, name: "Pequena", description: "Vaca holandeza de grande porte", female: true, breed: 1 , lot_id: 6, reproduction_id: 1, user_id: 1)
Animal.create(code: 544546, name: "Laranja", description: "Vaca holandeza de grande porte", female: true, breed: 1 , lot_id: 6, reproduction_id: 1, user_id: 1)

puts "Generates Reproduction"
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 1)
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 3)
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 4)
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 5)
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 3)
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 4)
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 4)
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 1)
Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: 2, mother_id: 3)

puts "Generate Notifications"
Notification.create(title: "Parto" , description: "Mimosa encontra-se próximo a data do parto, fique atento aos sinais, um parto não deve demorar mais de 4 horas, se preceber qualquer alteração ou complicação procure ajuda do médico veterianio, a saúde dos seus animais depende de você", limit: limit, user_id: 1)
Notification.create(title: "Cio" , description: "Bilasa encontra-se próximo a data do cio, fique atento aos sinais", limit: limit, user_id: 1)
Notification.create(title: "Desverminação" , description: "Pequena precisa ser deverminada.", limit: limit, user_id: 1)
Notification.create(title: "Mocha" , description: "Laranja precisa ser desverminada", limit: limit, user_id: 1)
Notification.create(title: "Parto" , description: "Mimosa encontra-se próximo a data do parto, fique atento aos sinais, um parto não deve demorar mais de 4 horas, se preceber qualquer alteração ou complicação procure ajuda do médico veterianio, a saúde dos seus animais depende de você", limit: limit, user_id: 1)
Notification.create(title: "Cio" , description: "Bilasa encontra-se próximo a data do cio, fique atento aos sinais", limit: limit, user_id: 1)
Notification.create(title: "Desverminação" , description: "Pequena precisa ser deverminada.", limit: limit, user_id: 1)
Notification.create(title: "Mocha" , description: "Laranja precisa ser desverminada", limit: limit, user_id: 1)
Notification.create(title: "Parto" , description: "Mimosa encontra-se próximo a data do parto, fique atento aos sinais, um parto não deve demorar mais de 4 horas, se preceber qualquer alteração ou complicação procure ajuda do médico veterianio, a saúde dos seus animais depende de você", limit: limit, user_id: 1)
Notification.create(title: "Cio" , description: "Bilasa encontra-se próximo a data do cio, fique atento aos sinais", limit: limit, user_id: 1)
Notification.create(title: "Desverminação" , description: "Pequena precisa ser deverminada.", limit: limit, user_id: 1)
Notification.create(title: "Mocha" , description: "Laranja precisa ser desverminada", limit: limit, user_id: 1)
