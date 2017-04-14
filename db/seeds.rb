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
	1.times do |t|
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
		puts Glebe.create( name: "Gleba #{t}", purpose: rand(1..3), area: rand(1..10), property_id: p.id, inactive: false) 
	end
end

puts "Generate Employee"

@property.each do |p|
	5.times do |t|
		puts Employee.create(work: "Trabalho #{t}", name: "Empregado #{t} #{p.id}", startwork: today, schooling: rand(1..5), salary: rand(1000..2500), payment: rand(1..2), property_id: p.id)
	end
end
 
puts "Generate Animals"

@users = User.all

@users.each do |user|
	male = Animal.create(code: (codes).sample.to_i, name: 'Destructor', female: male, breed: 1 , lot_id: 6, user_id: user.id)
	male2 = Animal.create(code: (codes).sample.to_i, name: 'Biond', female: male, breed: 1 , lot_id: 6, user_id: user.id)
	30.times do |a|
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
		@amount=rand(15..25)
	18.times do |a|
		@date = Time.now 
		@date_than = @date - a.months
		@amount = @amount + rand(-5..5)
		puts Production.create({ amount: @amount, measurement: @date_than, observation: nil, animal_id: animal.id})
	end
end

puts "Generates Developments"


@animais.each do |animal|
		@weight = rand(150..700)
		@height = rand(100..140)
	12.times do |a|
		@weight = @weight + rand(-3..60)
		@height = @height + rand(-2..10)
		puts Development.create({ weight: @weight, height: @height, animal_id: animal.id})
	end
end

puts "Generates Drugs"


15.times do |a|
	puts Drug.create({name: "Medicamento #{a}"})
end

puts "Generates Diseases"


20.times do |a|
	puts Disease.create({vulgarname: "Doença #{a}"})
end

puts "Generates Illness"

@animais.each do |animal|
	3.times do |a|
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


puts "Generates Shipments"

@property.each do |p|
	@date_than = Time.now - 1.year
	@amount=rand(350..500)
	210.times do |a|
		@amount = @amount + rand(-30..30)
		@date_than = @date_than + 3.days
		puts Shipment.create({ amount: @amount , date: @date_than, property_id: p.id})
	end
end

puts "Generates Analyses"

@property.each do |p|
	@date_than = Time.now - 1.year
	@fat = rand(10000..500000)
	@protein = rand(1000..50000)
	@lactose = rand(1000..50000)
	@totalsolids = rand(100..5000)
	@defattedextract = rand(1000..50000)
	@css = rand(10000..500000)
	@scorecss = rand(1000..50000)
	@ufc = rand(1000..50000)

	100.times do |a|
		@date_than       = @date_than + 3.days
		@fat             = @fat + rand(-2500..2500)
		@protein         = @protein + rand(-2500..2500)
		@lactose         = @lactose + rand(-2500..2500)
		@totalsolids     = @totalsolids + rand(-2500..2500)
		@defattedextract = @defattedextract + rand(-2500..2500)
		@css             = @css + rand(-2500..2500)
		@scorecss        = @scorecss + rand(-2500..2500)
		@ufc             = @ufc + rand(-2500..2500)
		puts Analysis.create({property_id: p.id , codeanalysis: rand(1000..50000), collect:  @date_than, fat:  @fat , protein: @protein  ,lactose: @lactose  , totalsolids: @totalsolids  , defattedextract: @defattedextract  , css: @css  , scorecss: @scorecss  , ufc: @ufc })
	end
end

puts "Generates Feeds"

puts Feed.create({kind: 1, name: "Bicarbonato de Sódio"})
puts Feed.create({kind: 1, name: "Gordura de Palma"})
puts Feed.create({kind: 1, name: "Melaço"})
puts Feed.create({kind: 1, name: "Monensina sódica"})
puts Feed.create({kind: 2, name: "Mistura Pronta"})
puts Feed.create({kind: 2, name: "Sal Comum"})
puts Feed.create({kind: 2, name: "Sal Concentrado"})
puts Feed.create({kind: 2, name: "Sal Grosso"})
puts Feed.create({kind: 2, name: "Sal micromineral-vitamínico"})
puts Feed.create({kind: 2, name: "Sal Mineral"})
puts Feed.create({kind: 2, name: "Sal Mineral com Ionóforo"})
puts Feed.create({kind: 2, name: "Sal Mineral com Tamponante"})
puts Feed.create({kind: 2, name: "Sal Mineral com Tamponante e Ionóforo"})
puts Feed.create({kind: 3, name: "Leite"})
puts Feed.create({kind: 3, name: "Leite de Soja"})
puts Feed.create({kind: 3, name: "Leite em Pó"})
puts Feed.create({kind: 3, name: "Suscedâneo do Leite"})
puts Feed.create({kind: 4, name: "Alfafa"})
puts Feed.create({kind: 4, name: "Amendoim Forrageiro"})
puts Feed.create({kind: 4, name: "Andropógon"})
puts Feed.create({kind: 4, name: "Aveia"})
puts Feed.create({kind: 4, name: "Azevém"})
puts Feed.create({kind: 4, name: "Braquiária"})
puts Feed.create({kind: 4, name: "Cana-de-açúcar"})
puts Feed.create({kind: 4, name: "Canarana"})
puts Feed.create({kind: 4, name: "Capim Buffel"})
puts Feed.create({kind: 4, name: "Capim Colonião"})
puts Feed.create({kind: 4, name: "Capim Elefante"})
puts Feed.create({kind: 4, name: "Capim Gordura"})
puts Feed.create({kind: 4, name: "Capim Mombaça"})
puts Feed.create({kind: 4, name: "Capim Tanzânia"})
puts Feed.create({kind: 4, name: "Capim Tobiatã"})
puts Feed.create({kind: 4, name: "Coast-cross"})
puts Feed.create({kind: 4, name: "Cratília"})
puts Feed.create({kind: 4, name: "Estilosantes"})
puts Feed.create({kind: 4, name: "Feno"})
puts Feed.create({kind: 4, name: "Grama Estrela"})
puts Feed.create({kind: 4, name: "Grama Pensacola"})
puts Feed.create({kind: 4, name: "Guandu"})
puts Feed.create({kind: 4, name: "Leucena"})
puts Feed.create({kind: 4, name: "Marandu"})
puts Feed.create({kind: 4, name: "Milho Verde"})
puts Feed.create({kind: 4, name: "Millheto"})
puts Feed.create({kind: 4, name: "Nabo Forrageiro"})
puts Feed.create({kind: 4, name: "Palma Forrageira"})
puts Feed.create({kind: 4, name: "Panicum"})
puts Feed.create({kind: 4, name: "Quicuio da Amazônia"})
puts Feed.create({kind: 4, name: "Setária"})
puts Feed.create({kind: 4, name: "Silagem de Capim"})
puts Feed.create({kind: 4, name: "Silagem de Milho"})
puts Feed.create({kind: 4, name: "Silagem de Sorgo"})
puts Feed.create({kind: 4, name: "Tifton"})
puts Feed.create({kind: 4, name: "Trevo Branco"})
puts Feed.create({kind: 4, name: "Trevo Vermelho"})
puts Feed.create({kind: 4, name: "Trevo Yuchi"})
puts Feed.create({kind: 4, name: "Xaraés"})
puts Feed.create({kind: 5, name: "Algodão (Caroço)"})
puts Feed.create({kind: 5, name: "Algodão (Farelo)"})
puts Feed.create({kind: 5, name: "Algodão (Torta)"})
puts Feed.create({kind: 5, name: "Amendoim (Torta)"})
puts Feed.create({kind: 5, name: "Calcário"})
puts Feed.create({kind: 5, name: "Centeio"})
puts Feed.create({kind: 5, name: "Cevada"})
puts Feed.create({kind: 5, name: "Concentrado para bezerros"})
puts Feed.create({kind: 5, name: "Concentrado para vacas"})
puts Feed.create({kind: 5, name: "Girassol"})
puts Feed.create({kind: 5, name: "Mamona"})
puts Feed.create({kind: 5, name: "Mandioca (Casca)"})
puts Feed.create({kind: 5, name: "Mandioca (Feno)"})
puts Feed.create({kind: 5, name: "Mandioca (Parte Aérea)"})
puts Feed.create({kind: 5, name: "Mandioca (Raiz)"})
puts Feed.create({kind: 5, name: "Milho"})
puts Feed.create({kind: 5, name: "Milho (Amido)"})
puts Feed.create({kind: 5, name: "Milho (Farelo)"})
puts Feed.create({kind: 5, name: "Milho (Fubá)"})
puts Feed.create({kind: 5, name: "Núcleo para Concentrado"})
puts Feed.create({kind: 5, name: "Poupa Cítrica"})
puts Feed.create({kind: 5, name: "Ração"})
puts Feed.create({kind: 5, name: "Ração para bezerros"})
puts Feed.create({kind: 5, name: "Ração para vacas em lactação"})
puts Feed.create({kind: 5, name: "Soja (Casca)"})
puts Feed.create({kind: 5, name: "Soja (Farelo)"})
puts Feed.create({kind: 5, name: "Soja (Grãos)"})
puts Feed.create({kind: 5, name: "Sorgo (Grãos)"})
puts Feed.create({kind: 5, name: "Suplementos Minerais"})
puts Feed.create({kind: 5, name: "Trigo (Farelo)"})
puts Feed.create({kind: 5, name: "Uréia"})
@feeds = Feed.all


puts "Generates Bin"

@property.each do |p|
	@date_than = Time.now - 1.year
	@amount=rand(3..10)
	3.times do |a|
		@amount = @amount + rand(1..30)
		@date_than = @date_than + 3.days
		puts Bin.create({ capacity: @amount , kind: rand(1..5), property_id: p.id})
	end
end

puts "Generates Stock"

@property.each do |p|
	@bins = Bin.where(property_id: p.id)

	@bins.each do |b|
		puts Stock.create({ 
        feed_id: @feeds.sample.id,
         bin_id: b.id,
    fournisseur: "André Luiz",
         amount: rand(1..5),
         density: rand(1..5),
      datestock: today,
      datestart: nil,
        dateend: nil,
})
	end
end
@stocks = Stock.all

puts "Generates Diet"

@animais.each do |animal|
		@amount=rand(15..25)
	6.times do |a|
		@date = Time.now 
		@date_than = @date - a.months
		@amount = @amount + rand(-3..10)
		puts Diet.create({ 
        amount: 50,
     datestart: today,
       dateend: nil,
     animal_id: animal.id,
      stock_id: @stocks.sample.id,

			})
	end
end