# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ruby enconding: utf-8

# Generate String
 
#################################################################### Variables #################################################################### 

o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
string = (0...50).map { o[rand(o.length)] }.join

codes = []
50.times do |d|
	n = [(0..9)].map(&:to_a).flatten
	codigo = (0...6).map { n[rand(n.length)] }.join
	codes << codigo
end

animals_names = ['Fumaça', 'Bila', 'Mimosa', 'Sairaça', 'Tudina', 'Laranja', 'Trona', 'Diaspora', 'Teimosa', 'Boneca', 'Chifruda', 'Beca', 'Bebela', 'Ariança', 'Magrela', 'Gaúcha', 'Beonça']

today = Time.now
insemination = today + 2.days
parturition = insemination + 9.months
limit = today + 7.days
stop = insemination + 7.months

#################################################################### Methods #################################################################### 

puts "Generate Profiles"
Profile.create(name: "Administrador", description: "Administrador geral do sistema")
Profile.create(name: "Agricultor", description: "Produtor rural")

puts "Generate User"
user = User.create(name: "Teste 1", email: "andrelzgava@gmail.com", password: "123456789")
User.create(name: "Teste 2", email: "andre_gava2006@yahoo.com.br", password: "123456789")

puts "Generate Properties"
property1 = Property.create(name: "Propriedade de teste", description: "Propriedade rural de produção leitera", long: 25.9422996, lat: -58.6004562, user_id: user.id)
property2 = Property.create(name: "Propriedade Gava", description: "Propriedade rural de produção leitera gava", long: 26.9422996, lat: -53.6004562, user_id: user.id)

puts "Generate Lots"

@property = Property.all

@property.each do |p|
	Lot.create(name: "Novilhos", description: "Novilhos Machos para abate", property_id: p.id)
	Lot.create(name: "Novilhas", description: "Novilhas de 9 meses até 18 meses", property_id: p.id)
	Lot.create(name: "Bezerros", description: "Animais de 0 até 9 meses de idade", property_id: p.id)
end

puts "Generate Animals"

@users = User.all
male = Animal.create(code: (codes).sample.to_i, name: 'Destructor', female: male, breed: 1 , lot_id: 6, user_id: user.id)
male2 = Animal.create(code: (codes).sample.to_i, name: 'Biond', female: male, breed: 1 , lot_id: 6, user_id: user.id)

@users.each do |user|
	50.times do |a|
		puts Animal.create(code: (codes).sample.to_i, name: animals_names.sample, female: true, breed: 1 , lot_id: 6, user_id: user.id)
	end
end

puts "Generates Reproduction"

@animais = Animal.all.where(female: true)

@animais.each do |animal|
	5.times do |a|
		puts Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: [male.id, male2.id].sample, mother_id: animal.id)
	end
end


puts "Generates Productions"

@animais.each do |animal|
	24.times do |a|
		@date = Time.now 
		@date_than = @date - a.months
		puts Production.create({ amount: rand(5..60), measurement: @date_than, observation: nil, animal_id: animal.id,})
	end
end


public

