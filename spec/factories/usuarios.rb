FactoryBot.define do
  factory :usuario do
    sequence(:password) { |n| "#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}"}
    sequence(:nome) {|n| "Fulano #{n}" }
    sequence(:telefone) { |n| "1234#{n}" }
    email { "fulano@email.com" }
    tipo { 0 }
  end
end
