FactoryBot.define do
  factory :demanda do
    status { 1 }
    rua { "MyString" }
    bairro { "MyString" }
    cidade { "MyString" }
    uf { "MyString" }
    numero { "MyString" }
    cep { 1 }
    complemento { "MyText" }
  end
end
