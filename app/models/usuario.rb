class Usuario < ApplicationRecord
  enum tipo: %i[anunciante administrador]

  has_many :demandas

  validates :nome, :cpf, presence: true
  validates :cpf, uniqueness: true
  validates :tipo, inclusion: { in: Usuario.tipos.keys }

end
