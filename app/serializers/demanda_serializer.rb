class DemandaSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :usuario_id, :peca_id, :rua, :bairro, :cidade, :uf, :numero, :cep, :complemento, :situacao

end
