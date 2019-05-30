class DemandaSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :usuario_id, :peca_id, :situacao

  belongs_to :usuario do
    link(:related) { usuario_url(object.usuario_id)}
  end

  belongs_to :peca do
    link(:related) { peca_url(object.peca_id)}
  end

  meta {{contato: object.contato, endereco_etrega: object.endereco_entrega, descricao: object.descricao}}

  link(:self) { demanda_url(object.id) }

end
