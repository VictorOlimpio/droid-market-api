class Usuario < ApplicationRecord
  enum tipo: %i[anunciante administrador]

  has_many :demandas

  validates :nome, :cpf, presence: true
  validates :tipo, inclusion: { in: Usuario.tipos.keys }
end
