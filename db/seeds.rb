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
fiftydays = today - 50.days
stop = insemination + 7.months

#################################################################### Methods #################################################################### 

puts "Generate Profiles"
Profile.create(name: "Administrador", description: "Administrador geral do sistema")
Profile.create(name: "Agricultor", description: "Produtor rural")

puts "Generate User"
User.create(name: "Teste 1", email: "andrelzgava@gmail.com", password: "123456789")
User.create(name: "Teste 2", email: "andre_gava2006@yahoo.com.br", password: "123456789")

puts "Generate Properties"
@users = User.all
@users.each do |p|
	2.times do |t|
		puts Property.create(name: "Propriedade de teste #{t}", description: "Propriedade rural de produção leitera", area: 100 , user_id: p.id)
	end
end

puts "Generate Lots"

@property = Property.all

@property.each do |p|
	puts Lot.create(name: "Novilhos", description: "Novilhos Machos para abate", property_id: p.id)
	puts Lot.create(name: "Novilhas", description: "Novilhas de 9 meses até 18 meses", property_id: p.id)
	puts Lot.create(name: "Bezerros", description: "Animais de 0 até 9 meses de idade", property_id: p.id)
end

puts "Generate Glebes"

@property.each do |p|
	5.times do |t|
		puts Glebe.create( name: "Gleba #{t}", purpose: rand(1..3), area: (1..10), property_id: p.id, inactive: false) 
	end
end

puts "Generate Employee"

@property.each do |p|
	5.times do |t|
		puts Employee.create(work: "Trabalho #{t}", name: "Empregado #{t} #{p}", startwork: today, schooling: rand(1..5), salary: rand(1000..2500), payment: rand(1..2), property_id: p.id)
	end
end
 
puts "Generate Animals"

@users = User.all

@users.each do |user|
	male = Animal.create(code: (codes).sample.to_i, name: 'Destructor', female: male, breed: 1 , lot_id: 6, user_id: user.id)
	male2 = Animal.create(code: (codes).sample.to_i, name: 'Biond', female: male, breed: 1 , lot_id: 6, user_id: user.id)
	50.times do |a|
		puts Animal.create(code: (codes).sample.to_i, name: animals_names.sample, female: true, breed: 1 , lot_id: 6, user_id: user.id)
	end
end

puts "Generates Reproduction"

@animais = Animal.all.where(female: true)



@animais.each do |animal|
	5.times do |a|
		puts Reproduction.create( heat: today, insemination: insemination, stop_breastfeeding: stop, parturition: parturition, father_id: [1, 2].sample, mother_id: animal.id)
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

puts "Generates Developments"

@animais.each do |animal|
	2.times do |a|
		@weight = rand(450..890)
		@height = rand(140..170)
		puts Development.create({ weight: @weight, height: @height, animal_id: animal.id,})
	end
end

puts "Generates Drugs"


20.times do |a|
	puts Drug.create({name: "Medicamento #{a}"})
end

puts "Generates Diseases"


20.times do |a|
	puts Disease.create({vulgarname: "Doença #{a}"})
end

puts "Generates Illness"

@animais.each do |animal|
	5.times do |a|
		@disease = rand(1..20)
		@start = rand(fiftydays..today)
		@end = rand(today..limit)
		puts Illness.create({startdate: @start, enddate: @end, animal_id: animal.id, disease_id: @disease})
	end
end

puts "Generates Treatment"

@illnesses = Illness.all

@illnesses.each do |illness|
	2.times do |a|
		@drug = rand(1..20)
		@start = rand(fiftydays..today)
		@end = rand(today..limit)
		@q = rand(0..20)
		puts Treatment.create({ startdate: @start, enddate: @end, dosage: @q, lack: nil, illness_id: illness.id, drug_id: @drug})
	end
end





