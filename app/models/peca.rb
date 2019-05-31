require 'core_ext/active_record_enum_enum_type'

class Peca < ApplicationRecord
  paginates_per 5

  enum tipo: %i[cabeca tronco braco_esquerdo braco_direito perna_esquerda perna_direita blaster]

  has_many :demandas

  validates :tipo, inclusion: { in: Peca.tipos.keys }
  validates :valor, presence: true
end
