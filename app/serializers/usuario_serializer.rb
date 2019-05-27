class UsuarioSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :nome, :cpf, :telefone, :email, :tipo

  has_many :demandas

end
