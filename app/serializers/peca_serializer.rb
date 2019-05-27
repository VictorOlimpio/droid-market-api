class PecaSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :tipo, :descricao, :valor

  has_many :demandas

end
