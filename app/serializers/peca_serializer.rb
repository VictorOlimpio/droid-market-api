class PecaSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :tipo, :descricao, :valor

  has_many :demandas do
    link(:related) { peca_demandas_url(object.id) }
  end

  link(:self) { peca_url(object.id) }

end
