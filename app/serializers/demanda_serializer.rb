class DemandaSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :usuario_id, :peca_id, :situacao

  belongs_to :usuario do
    link(:related) { demanda_usuario_url(object.id) }
  end

  belongs_to :peca do
    link(:related) { demanda_peca_url(object.id) }
  end

  meta {{contato: object.contato, endereco_etrega: object.endereco_entrega, descricao: object.descricao}}

  link(:self) { demanda_url(object.id) }

end
