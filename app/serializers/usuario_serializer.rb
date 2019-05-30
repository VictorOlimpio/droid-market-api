class UsuarioSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :nome, :telefone, :email, :tipo

  has_many :demandas

  link(:self) { usuario_url(object.id) }

end
