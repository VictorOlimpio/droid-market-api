class Demanda < ApplicationRecord

  enum situacao: %i[aberta finalizada]

  belongs_to :usuario
  belongs_to :peca

  validates :rua, :bairro, :cidade, :uf, :numero, :cep, presence: true
  validates :situacao, inclusion: { in: Demanda.situacoes.keys }
end
