class Peca < ApplicationRecord
  enum tipo: %i[cabeca tronco braco_esquerdo braco_direito perna_esquerda perna_direita blaster]

  has_many :demandas

  validates :tipo, inclusion: { in: Peca.tipos.keys }
  validates :valor, presence: true
end
