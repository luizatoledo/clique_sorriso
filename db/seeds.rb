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
									birthday: Time.now,
									email: 'laranjeira@email.com',
									password: '123456')

u2 = User.create!(role: 'dentist', 
									admin: false,
									first_name: 'Maria',
									last_name: 'Souza',
									cpf: '111.111.111-11',
									phone_number: '(11)99999-9999',
									address: 'Rua Harmonia, 555, São Paulo',
									birthday: Time.now + 1,
									email: 'maria@email.com',
									password: '123456')

u3 = User.create!(role: 'dentist', 
									admin: true,
									first_name: 'Jose',
									last_name: 'Dias',
									cpf: '222.222.222-22',
									phone_number: '(11)99999-9999',
									address: 'Rua Purpurina, 975, São Paulo',
									birthday: Time.now + 2,
									email: 'jose@email.com',
									password: '123456')

u4 = User.create!(role: 'patient', 
									admin: false,
									first_name: 'Marcela',
									last_name: 'Marotta',
									cpf: '333.333.333-33',
									phone_number: '(11)99999-9999',
									address: 'Rua dos Pinheiros, 1115, São Paulo',
									birthday: Time.now + 3,
									email: 'marcela@email.com',
									password: '123456')

# Dentist

d1 = Dentist.new(approved: true, cro: '000.000', specialty: 'Periodontista')
d1.user = u2
d1.save!

d2 = Dentist.new(approved: true, cro: '111.111', specialty: 'Ortodontista')
d2.user = u3
d2.save!

# Appointment

a1 = Appointment.new(date: Time.now + 10.hours)
a1.user = u1
a1.save!

a2 = Appointment.new(date: Time.now + 10)
a2.user = u4
a2.save!

# Service
s1 = Service.create!(title: 'Clareamento',
								 description: 'Utilização de substâncias clareadoras para um sorriso mais bonito',
								 duration: 90)

s2 = Service.create!(title: 'Canal',
								 description: 'Tratamento de cárie que interferiu no canal do dente',
								 duration: 150)

s3 = Service.create!(title: 'Profilaxia',
								 description: 'Limpeza geral dos dentes, com flúor ao final',
								 duration: 100)

s4 = Service.create!(title: 'Remoção de tártaro',
								 description: 'Raspagem básica de pouco tártaro',
								 duration: 30)

# Procedure
# Dentista 1
p1 = Procedure.new()
p1.dentist = d1
p1.service = s3
p1.save!

p2 = Procedure.new
p2.dentist = d1
p2.service = s4
p2.save!

p3 = Procedure.new
p3.dentist = d1
p3.service = s1
p3.save!

# Dentista 2

p4 = Procedure.new()
p4.dentist = d2
p4.service = s1
p4.save!

p5 = Procedure.new
p5.dentist = d1
p5.service = s2
p5.save!

# Treatment

t1 = Treatment.new()
t1.appointment = a1
t1.procedure = p1
t1.save!

t2 = Treatment.new()
t2.appointment = a1
t2.procedure = p2
t2.save!

t3 = Treatment.new()
t3.appointment = a2
t3.procedure = p4
t3.save!

t4 = Treatment.new()
t4.appointment = a2
t4.procedure = p2
t4.save!

t5 = Treatment.new()
t5.appointment = a1
t5.procedure = p3
t5.save!