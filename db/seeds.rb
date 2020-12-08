require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
u1 = User.create!(role: 'patient', 
									admin: false,
									first_name: 'Laranjeira',
									last_name: 'Bonita',
									cpf: '000.000.000-00',
									phone_number: '(11)99999-9999',
									address: 'Rua Jerico, 193, São Paulo',
									birthday: '1996-11-26',
									email: 'laranjeira@email.com',
									password: '123456')
file1= URI.open('https://ca.slack-edge.com/T02NE0241-U01C8ATLURL-7adf44f6db07-512')
u1.photo.attach(io: file1, filename: 'user1.png', content_type: 'image/png')

u2 = User.create!(role: 'dentist', 
									admin: false,
									first_name: 'Maria',
									last_name: 'Souza',
									cpf: '111.111.111-11',
									phone_number: '(11)99999-9999',
									address: 'Rua Harmonia, 555, São Paulo',
									birthday: '1975-06-08',
									email: 'maria@email.com',
									password: '123456')
file2 = URI.open('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
u2.photo.attach(io: file2, filename: 'user2.png', content_type: 'image/png')

u3 = User.create!(role: 'dentist', 
									admin: true,
									first_name: 'Jose',
									last_name: 'Dias',
									cpf: '222.222.222-22',
									phone_number: '(11)99999-9999',
									address: 'Rua Purpurina, 975, São Paulo',
									birthday: '1960-04-01',
									email: 'jose@email.com',
									password: '123456')
file3 = URI.open('https://ca.slack-edge.com/T02NE0241-U01D4FKS1DE-7495051c3457-512')
u3.photo.attach(io: file3, filename: 'user3.png', content_type: 'image/png')

u4 = User.create!(role: 'patient', 
									admin: false,
									first_name: 'Marcela',
									last_name: 'Marotta',
									cpf: '333.333.333-33',
									phone_number: '(11)99999-9999',
									address: 'Rua dos Pinheiros, 1115, São Paulo',
									birthday: '1992-07-24',
									email: 'marcela@email.com',
									password: '123456')
file4 = URI.open('https://ca.slack-edge.com/T02NE0241-U01D4SEMHL0-5bff3aeeae7f-512')
u4.photo.attach(io: file4, filename: 'user4.png', content_type: 'image/png')
									
u5 = User.create!(role: 'patient', 
									admin: false,
									first_name: 'Luiza',
									last_name: 'Toledo',
									cpf: '444.444.444-44',
									phone_number: '(11)99999-9999',
									address: 'Rua Cayowaa, 1575, São Paulo',
									birthday: '1996-09-11',
									email: 'luiza@email.com',
									password: '123456')
file5 = URI.open('https://ca.slack-edge.com/T02NE0241-U01C7U49X46-155e289c591e-512')
u5.photo.attach(io: file5, filename: 'user5.png', content_type: 'image/png')

# Dentist
d1 = Dentist.new(approved: true, cro: '000.000', specialty: 'Periodontista')
d1.user = u2
d1.save!

d2 = Dentist.new(approved: true, cro: '111.111', specialty: 'Ortodontista')
d2.user = u3
d2.save!

# Service
s1 = Service.create!(title: 'Clareamento',
								 description: 'Procedimento estético para torar os tons do esmalte dentário mais claros. Utiliza-se produtos a base de peróxido de hidrogênio',
								 duration: 45)
img_clareamento = URI.open('https://conteudo.imguol.com.br/c/entretenimento/e1/2020/09/08/dentes-brancos-sorriso-bonito-1599583111401_v2_450x337.jpg')
s1.photo.attach(io: img_clareamento, filename: 'clareamento.png', content_type: 'image/png')

s2 = Service.create!(title: 'Tratamento de Canal',
								 description: 'Tratamento de cárie que interferiu na polpa do dente',
								 duration: 150)
img_canal = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dentalartepoa.com.br%2Fsorria%2Fquando-e-preciso-fazer-tratamento-de-canal%2F&psig=AOvVaw28TYMiFlKg4VESdfPE2CmL&ust=1607457896400000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDt-LzVvO0CFQAAAAAdAAAAABAD')
s2.photo.attach(io: img_canal, filename: 'canal.png', content_type: 'image/png')

s3 = Service.create!(title: 'Profilaxia | Limpeza Dentária',
								 description: 'Limpeza geral dos dentes, com aplicação de flúor ao final',
								 duration: 100)
img_profilaxia = URI.open('https://luisgustavoleite.com.br/blog/wp-content/uploads/2019/08/limpeza-dental-profilaxia-post-blog.jpg')
s3.photo.attach(io: img_profilaxia, filename: 'profilaxia.png', content_type: 'image/png')

s4 = Service.create!(title: 'Remoção de tártaro',
								 description: 'Raspagem básica de pouco tártaro',
								 duration: 30)
img_tartaro = URI.open('https://lh3.googleusercontent.com/proxy/5lqRT8LIRYQOVZ7nZ5Za76iaKhgJO5fSO0lUS4Yl_Sf1SEmT7cv40jgG0eLsQxv9B6IiA3cb7F0OFKQuw8UoO9ikREHDeotzLx__KWNyfca_FTrTzJ9R55YhE8PzjuULCHlJD6L7DszkUeCPmNHULik3Dyb_VEh0k02m45VNdPHaPcN0mak')
s4.photo.attach(io: img_tartaro, filename: 'tartaro.png', content_type: 'image/png')

s5 = Service.create!(title: 'Consulta Online',
									description: '30 minutos de conversa com o dentista para tirar dúvidas e passar orientações prévias ou pedidos de exame. O valor da consulta é revertido se o paciente da prosseguimento ao tratamento',
									duration: 30)
img_online = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7G-saONWYuzsmdI4_lDVD2ttUoY_U1eD6ug&usqp=CAU')
s5.photo.attach(io: img_online, filename: 'online.png', content_type: 'image/png')

s6 = Service.create!(title: 'Aparelho Ortodôntico - Instalação ou Remoção',
										description: 'Preparativos e inerção de bandas e brackets',
										duration: 100)
img_aparelho_ins = URI.open('https://static1.sorrisologia.com.br/articles//9/46/29/@/14129-ele-costuma-ser-maior-medo-de-todo-trat-800x800-1.jpg')
s6.photo.attach(io: img_aparelho_ins, filename: 'aparelho_ins.png', content_type: 'image/png')
		

s7 = Service.create!(title: 'Aparelho Ortodôntico - Manutenção',
										description: 'Ajustes periódicos',
										duration: 45)
img_aparelho_manut = URI.open('https://conquistodontologia.com.br/wp-content/uploads/2018/09/ortodontia-1024x576.jpg')
s7.photo.attach(io: img_aparelho_manut, filename: 'aparelho_manut.png', content_type: 'image/png')

# Procedure
# Dentista 1
p1 = Procedure.new
p1.dentist = d1
p1.service = s1
p1.save!

p2 = Procedure.new
p2.dentist = d1
p2.service = s2
p2.save!

p3 = Procedure.new
p3.dentist = d1
p3.service = s3
p3.save!

p4 = Procedure.new
p4.dentist = d1
p4.service = s4
p4.save!

p5 = Procedure.new
p5.dentist = d1
p5.service = s5
p5.save!

# Dentista 2

p6 = Procedure.new
p6.dentist = d2
p6.service = s3
p6.save!

p7 = Procedure.new
p7.dentist = d2
p7.service = s5
p7.save!

p8 = Procedure.new
p8.dentist = d2
p8.service = s6
p8.save!

p9 = Procedure.new
p9.dentist = d2
p9.service = s7
p9.save!

# User 1 appointments and treatments
a1 = Appointment.new
a1.user = u1 
a1.date = '2020-07-12 09:00:00'
a1.save!

t1 = Treatment.new
t1.appointment = a1
t1.procedure = p5
t1.save!

a2 = Appointment.new
a2.user = u1
a2.date = '2020-10-15 12:30:00'
a2.save!

t2 = Treatment.new()
t2.appointment = a2
t2.procedure = p3
t2.save!

t3 = Treatment.new()
t3.appointment = a2
t3.procedure = p4
t3.save!

a3 = Appointment.new
a3.user = u1
a3.date = '2020-12-14 09:00:00'
a3.save!

t4 = Treatment.new()
t4.appointment = a3
t4.procedure = p1
t4.save!

# User 4 appointments and treatments

a4 = Appointment.new
a4.user = u4
a4.date = '2020-12-14 15:00:00'
a4.save!

t5 = Treatment.new
t5.appointment = a4
t5.procedure = p7
t5.save!

# User 5 appointments and treatments

a5 = Appointment.new
a5.date = '2019-09-18 16:15:00'
a5.user = u5
a5.save!

t6 = Treatment.new
t6.appointment = a5
t6.procedure = p7
t6.save!

a6 = Appointment.new
a6.date = '2019-10-01 08:30:00'
a6.user = u5
a6.save!

t7 = Treatment.new
t7.appointment = a6
t7.procedure = p8
t7.save!

a7 = Appointment.new
a7.date = '2019-11-01 14:30:00'
a7.user = u5
a7.save!

t8 = Treatment.new
t8.appointment = a7
t8.procedure = p9
t8.save!

a8 = Appointment.new
a8.user = u5
a8.date = '2019-12-01 15:45:00'
a8.save!

t9 = Treatment.new
t9.appointment = a8
t9.procedure = p9
t9.save!

t10 = Treatment.new
t10.appointment = a8
t10.procedure = p3
t10.save!


#Laboratories

labo_infos = [{name: "Indor Jardim Paulista", address: "Avenida Brigadeiro Luiz Antônio, 4778, São Paulo"},
{name: "Indor Pacaembu", address: "Rua Cardoso de Almeida, 2121, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Ibirapuera", address: "Avenida Ibirapuera, 2823, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Av Brasil", address: "Avenida Brasil, 263, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Ipiranga", address: "Rua Lino Coutinho, 1855, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Rebouças", address: "Avenida Rebouças, 1223, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Vl. Clementino", address: "Avenida Senador Casemiro da Rocha, 392, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Mooca", address: "Avenida Paes de Barros, 2050, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Sto Amaro", address: "Avenida Adolfo Pinheiro, 842, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Osasco", address: "Rua Eloy Candido Lopes, 169, Osasco"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Jardim Londrina", address: "Avenida Doutor Guilherme Dumont Vilares, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Tatuapé", address: "Rua Itapura, 850, São Paulo"},
{name: "Papaiz Diagnósticos Odontológicos por Imagem - Lapa", address: " Rua Pio XI, 257,São Paulo"},
{name: "ISO Radiologia - Vila Mariana", address: "Rua Vergueiro, 1898, São Paulo"},
{name: "ISO Radiologia - Tatuapé", address: "Rua Serra de Bragança, 358, São Paulo"},
{name: "ISO Radiologia - Freguesia do Ó", address: "Rua Candida Franco de Barros, 77, São Paulo"},
{name: "ISO Radiologia - Santo Amaro", address: "Avenida Adolfo Pinheiro, 1854, São Paulo"},
{name: "ISO Radiologia - Ipiranga", address: "Rua Visconde de Pirajá, 553, São Paulo"},
{name: "ISO Radiologia - Pirituba", address: "Avenida Benedito de Andrade, 126, São Paulo"},
{name: "ISO Radiologia - Guarulhos", address: "Avenida Doutor Timóteo Penteado, 169, São Paulo"},
{name: "ISO Radiologia - Campo Limpo", address: "Rua Felix Fagundes, 19, São Paulo"},
{name: "ISO Radiologia - Mooca", address: "Avenida Paes de Barros, 1562, São Paulo"},
{name: "ISO Radiologia - Santana", address: "Rua Duarte de Azevedo, 86, São Paulo"},
{name: "ISO Radiologia - Osasco", address: "Rua Itabuna, 195, Osasco"},
{name: "ISO Radiologia - São Bernardo do Campo", address: "Avenida Índico, 278, São Bernardo do Campo"},
{name: "ISO Radiologia - Lapa", address: "Rua Pio XI, 465, São Paulo"},
{name: "ISO Radiologia - Cidade Dutra", address: "Rua Guaruva ,223, São Paulo"},
{name: "ISO Radiologia - São Miguel", address: "Rua João Augusto Morais, 168, São Paulo"},
{name: "ISO Radiologia - São Mateus", address: "Avenida Sapopemba, 13.933, São Paulo"},
{name: "ISO Radiologia - Pinheiros", address: "Avenida Pedroso de Morais, 171, São Paulo"},
{name: "ISO Radiologia - Vila Cachoeirinha", address: "Rua Adolfo Kurt Boehm, 38, São Paulo"}]

labo_infos.count.times do |i|
  Laboratory.create(labo_infos[i])
end
