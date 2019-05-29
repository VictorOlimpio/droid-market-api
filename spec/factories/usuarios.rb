FactoryBot.define do
  factory :usuario do
    sequence(:nome) {|n| "Fulano #{n}" }
    sequence(:telefone) { |n| "1234#{n}" }
    email { "fulano@email.com" }
    tipo { 0 }
  end
end
