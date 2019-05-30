class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  paginates_per 5

  enum tipo: %i[anunciante administrador]

  has_many :demandas

  validates :nome, presence: true
  validates :tipo, inclusion: { in: Usuario.tipos.keys }

end
