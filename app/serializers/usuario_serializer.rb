class UsuarioSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :nome, :telefone, :email, :tipo

  has_many :demandas do
    link(:related) { usuario_demandas_url(object.id) }
  end

end
