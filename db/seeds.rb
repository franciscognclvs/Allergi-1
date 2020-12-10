# CompoundMix.destroy_all
# Medicine.destroy_all
# Substance.destroy_all


# text = "Lactulose ( 21 )
# Secnidazol ( 21 )
# Succinato de Metoprolol ( 21 )
# Acebrofilina ( 20 )
# Alendronato de Sódio ( 19 )"

# substances = text.split(/\n/).map {|sub| sub.gsub(/\(\s\d{2,3}\s\)/, "").strip }


# def call_site(substance)
#   sleep 2
#   substance = ERB::Util.url_encode(substance)
#   url = "https://consultaremedios.com.br/b/*?filter[substance][]=#{substance}"
#   open(url).read
# end

# substances.each do |substance| 
# 	response = call_site(substance)
# 	html_doc = Nokogiri::HTML(response)
# 	puts "criando substancia #{substance} "
# 	s = Substance.create!(
# 			name: substance
# 		)
# 	html_doc.search('.result-item').each do |item|
# 		name = item.search(".result-item__product-name").first.text.strip
# 		m = Medicine.find_by(name: name)
# 		unless m.present?
# 			puts "criando medicine #{name}"
# 			m = Medicine.create!(
# 				name: name,
# 				principle: item.search(".result-item__meta-info-text").first.text.strip,
# 				laboratory: item.search(".result-item__meta-info-wrapper .result-item__meta-info-text").last.text.strip
# 			)
# 			url = "https://" + item.search('img').last.values[3].split("//")[2]
# 			puts "salvando imagem #{url}"
# 			file = URI.open(url)
# 			m.photo.attach(io: file, filename: "#{m.id}.jpg", content_type: 'image/png')
# 		end
# 		c = CompoundMix.find_by(substance: s, medicine: m)
# 		CompoundMix.create!(
# 				substance: s,
# 				medicine: m
# 			) unless c.present?
# 		puts "#{s.name} #{m.name} created on db"
# 	end
# end
puts 'Criando Substances'
sleep 1
s1 = Substance.create!(name:'Dipirona monoidratada')
s2 = Substance.create!(name:'Paracetamol')
s3 = Substance.create!(name:'Ibuprofeno')
s4 = Substance.create!(name:'Acido Acetilsalicílico')
puts 'OK'

puts 'Criando Medicines'
sleep 1
m1 = Medicine.create!(name: 'Novalgina', principle: 'Dipirona monoidratada', laboratory: 'Sanofi Medley')
m2 = Medicine.create!(name: 'Tylenol', principle: 'Paracetamol', laboratory:'Janssen-Cilag')
m3 = Medicine.create!(name: 'Advil', principle: 'Ibuprofeno', laboratory:'Wyeth/Pfizer')
m4 = Medicine.create!(name: 'Dorflex', principle: 'Dipirona monoidratada', laboratory:'Sanofi Medley')
m5 = Medicine.create!(name: 'Aspirina', principle: 'Acido Acetilsalicílico', laboratory: 'Bayer')
puts 'OK'

puts 'Criando CompoundMix'
sleep 1

CompoundMix.create!(substance: s1, medicine: m1)
CompoundMix.create!(substance: s1, medicine: m4)
CompoundMix.create!(substance: s2, medicine: m2)
CompoundMix.create!(substance: s3, medicine: m3)
CompoundMix.create!(substance: s4, medicine: m5)
puts 'OK'

puts 'Criando Doctor'
sleep 1
d1 = Doctor.create!(email:'123@doctor.com', password: '123456', name: 'Dr. Rogerio', phone: '11998989898', crm: '123456789', address: 'Rua ao lado da Jericó', emergency_phone: '11998989898')
puts 'OK'
puts 'Criando User'
sleep 1
User.create!(name:'Willian Arão', phone: '11990909090', cpf: '12312312312', address: 'Rua Jericó', weight: 99.5, email: '123@user.com', password: '123456')
puts 'OK'


puts 'Criando Reações Alergicas'
sleep 1
Reaction.create!(name:'Sneeze')
Reaction.create!(name:'Shortness of breathe')
Reaction.create!(name:'Panting')
Reaction.create!(name:'Coryza')
Reaction.create!(name:'Rash')
Reaction.create!(name:'Hives')
Reaction.create!(name:'Swelling')
Reaction.create!(name:'Itch')
Reaction.create!(name:'Nausea')
Reaction.create!(name:'Vomit')
Reaction.create!(name:'Colic')
Reaction.create!(name:'Diarrhea')
puts 'OK'
