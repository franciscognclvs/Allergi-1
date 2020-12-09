# CompoundMix.destroy_all
# Medicine.destroy_all
# Substance.destroy_all

text = "Colecalciferol (Vitamina D) ( 163 )
Paracetamol ( 88 )
Dipirona Monoidratada ( 72 )
Rosuvastatina Cálcica ( 72 )
Ibuprofeno ( 71 )
Cloreto de Sódio ( 65 )
Cloridrato de Metformina ( 62 )
Simeticona ( 62 )
Levotiroxina Sódica ( 58 )
Carvedilol ( 54 )
Pantoprazol ( 53 )
Besilato de Anlodipino ( 52 )
Atorvastatina Cálcica ( 51 )
Colágeno Hidrolisado ( 51 )
Desloratadina ( 50 )
Cloridrato de Ciclobenzaprina ( 48 )
Drospirenona + Etinilestradiol ( 48 )
Citrato de Sildenafila ( 47 )
Ácido Ascórbico (Vitamina C) ( 47 )
Tadalafila ( 46 )
Acetilcisteína ( 43 )
Aciclovir ( 43 )
Azitromicina ( 42 )
Amoxicilina ( 41 )
Gestodeno + Etinilestradiol ( 41 )
Sinvastatina ( 41 )
Esomeprazol Magnésico ( 39 )
Cetoconazol ( 38 )
Oxalato de Escitalopram ( 38 )
Omeprazol ( 36 )
Gliclazida ( 35 )
Atenolol ( 34 )
Cloridrato de Ambroxol ( 34 )
Cloridrato de Venlafaxina ( 33 )
Maleato de Enalapril ( 33 )
Prednisolona ( 33 )
Cetoprofeno ( 32 )
Nimesulida ( 32 )
Cetoconazol + Dipropionato de Betametasona + Sulfato de Neomicina ( 31 )
Colágeno Não Hidrolisado do Tipo II ( 31 )
Diosmina + Hesperidina ( 31 )
Fluconazol ( 31 )
Losartana Potássica ( 31 )
Mesilato de Doxazosina ( 31 )
Montelucaste de Sódio ( 31 )
Glibenclamida ( 30 )
Meloxicam ( 30 )
Alprazolam ( 29 )
Bicarbonato de Sódio + Carbonato de Sódio + Ácido Cítrico ( 29 )
Cloridrato de Benzidamina ( 29 )
Desogestrel ( 29 )
Domperidona ( 29 )
Hemifumarato de Quetiapina ( 29 )
Maleato de Dexclorfeniramina ( 29 )
Diclofenaco Sódico ( 28 )
Dicloridrato de Betaistina ( 28 )
Glimepirida ( 28 )
Amoxicilina + Clavulanato de Potássio ( 27 )
Cafeína + Carisoprodol + Diclofenaco Sódico + Paracetamol ( 27 )
Cloridrato de Fenilefrina + Paracetamol + Maleato de Clorfeniramina ( 27 )
Diclofenaco Dietilamônio ( 27 )
Finasterida ( 27 )
Losartana Potássica + Hidroclorotiazida ( 27 )
Maleato de Dexclorfeniramina + Betametasona ( 27 )
Passiflora incarnata ( 26 )
Suplemento Vitamínico + Mineral ( 26 )
Albendazol ( 25 )
Bromoprida ( 25 )
Cloreto de Potássio + Cloreto de Sódio + Citrato de Sódio + Glicose ( 25 )
Cloridrato de Fexofenadina ( 25 )
Multivitamínicos + Sais Minerais ( 25 )
Clotrimazol ( 24 )
Dipirona Monoidratada + Citrato de Orfenadrina + Cafeína ( 24 )
Enoxaparina Sódica ( 24 )
Fosfato Sódico de Prednisolona ( 24 )
Hedera helix ( 24 )
Ácido Acetilsalicílico ( 24 )
Acetato de Ciproterona + Etinilestradiol ( 23 )
Atenolol + Clortalidona ( 23 )
Budesonida ( 23 )
Loratadina ( 23 )
Orlistate ( 23 )
Propionato de Clobetasol ( 23 )
Ácido Fólico ( 23 )
Cloridrato de Sertralina ( 22 )
Lactase ( 22 )
Polivitamínico + Minerais ( 22 )
Risperidona ( 22 )
Topiramato ( 22 )
Valsartana ( 22 )
Captopril ( 21 )
Cetoconazol + Dipropionato de Betametasona ( 21 )
Clonazepam ( 21 )
Cloridrato de Duloxetina ( 21 )
Hemifumarato de Bisoprolol ( 21 )
Lactulose ( 21 )
Secnidazol ( 21 )
Succinato de Metoprolol ( 21 )
Acebrofilina ( 20 )
Alendronato de Sódio ( 19 )"

substances = text.split(/\n/).map {|sub| sub.gsub(/\(\s\d{2,3}\s\)/, "").strip }


def call_site(substance)
  sleep 2
  substance = ERB::Util.url_encode(substance)
  url = "https://consultaremedios.com.br/b/*?filter[substance][]=#{substance}"
  open(url).read
end

substances.each do |substance| 
	response = call_site(substance)
	html_doc = Nokogiri::HTML(response)
	puts "criando substancia #{substance} "
	s = Substance.create!(
			name: substance
		)
	html_doc.search('.result-item').first(2).each do |item|
		name = item.search(".result-item__product-name").first.text.strip
		m = Medicine.find_by(name: name)
		unless m.present?
			puts "criando medicine #{name}"
			m = Medicine.create!(
				name: name,
				principle: item.search(".result-item__meta-info-text").first.text.strip,
				laboratory: item.search(".result-item__meta-info-wrapper .result-item__meta-info-text").last.text.strip
			)
			url = "https://" + item.search('img').last.values[3].split("//")[2]
			puts "salvando imagem #{url}"
			file = URI.open(url)
			m.photo.attach(io: file, filename: "#{m.id}.jpg", content_type: 'image/png')
		end
		c = CompoundMix.find_by(substance: s, medicine: m)
		CompoundMix.create!(
				substance: s,
				medicine: m
			) unless c.present?
		puts "#{s.name} #{m.name} created on db"
	end
end
# puts 'Criando Substances'
# sleep 1
# s1 = Substance.create!(name:'Dipirona monoidratada')
# s2 = Substance.create!(name:'Paracetamol')
# s3 = Substance.create!(name:'Ibuprofeno')
# s4 = Substance.create!(name:'Acido Acetilsalicílico')
# puts 'OK'

# puts 'Criando Medicines'
# sleep 1
# m1 = Medicine.create!(name: 'Novalgina', principle: 'Dipirona monoidratada', laboratory: 'Sanofi Medley')
# m2 = Medicine.create!(name: 'Tylenol', principle: 'Paracetamol', laboratory:'Janssen-Cilag')
# m3 = Medicine.create!(name: 'Advil', principle: 'Ibuprofeno', laboratory:'Wyeth/Pfizer')
# m4 = Medicine.create!(name: 'Dorflex', principle: 'Dipirona monoidratada', laboratory:'Sanofi Medley')
# m5 = Medicine.create!(name: 'Aspirina', principle: 'Acido Acetilsalicílico', laboratory: 'Bayer')
# puts 'OK'

# puts 'Criando CompoundMix'
# sleep 1

# CompoundMix.create!(substance: s1, medicine: m1)
# CompoundMix.create!(substance: s1, medicine: m4)
# CompoundMix.create!(substance: s2, medicine: m2)
# CompoundMix.create!(substance: s3, medicine: m3)
# CompoundMix.create!(substance: s4, medicine: m5)
# puts 'OK'

# puts 'Criando Doctor'
# sleep 1
# d1 = Doctor.create!(email:'123@doctor.com', password: '123456', name: 'Dr. Rogerio', phone: '11998989898', crm: '123456789', address: 'Rua ao lado da Jericó', emergency_phone: '11998989898')
# puts 'OK'
# puts 'Criando User'
# sleep 1
# User.create!(name:'Willian Arão', phone: '11990909090', cpf: '12312312312', address: 'Rua Jericó', weight: 99.5, email: '123@user.com', password: '123456')
# puts 'OK'


# puts 'Criando Reações Alergicas'
# sleep 1
# Reaction.create!(name:'Espirro')
# Reaction.create!(name:'Falta de ar')
# Reaction.create!(name:'Respiração ofegante')
# Reaction.create!(name:'Coriza')
# Reaction.create!(name:'Erupção cutânea')
# Reaction.create!(name:'Urticária')
# Reaction.create!(name:'Inchaço')
# Reaction.create!(name:'Coceira')
# Reaction.create!(name:'Náusea')
# Reaction.create!(name:'Vômito')
# Reaction.create!(name:'Cólica')
# Reaction.create!(name:'Diarreia')
# puts 'OK'