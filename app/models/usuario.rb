class Usuario < ApplicationRecord
  enum tipo: %i[administrador anunciante]

  has_many :demandas

  validates :nome, presence: true
  validates :cpf, presence: true
  validates :tipos, inclusion: { in: Usuario.tipos.keys }
end
