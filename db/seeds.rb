# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usuario.destroy_all
Peca.destroy_all
Demanda.destroy_all

puts 'Criando Anunciantes'

Faker::Config.locale = 'pt-BR'

10.times do
  Usuario.create!(nome: Faker::Name.name,
                  email: Faker::Internet.email,
                  telefone: Faker::PhoneNumber.phone_number,
                  tipo: 0)
end

