require 'core_ext/active_record_enum_enum_type'

class Demanda < ApplicationRecord

  # Kaminari
  paginates_per 5

  enum situacao: %i[aberta finalizada]

  belongs_to :usuario
  belongs_to :peca

  validates :rua, :bairro, :cidade, :uf, :numero, :cep, presence: true
  validates :situacao, inclusion: { in: Demanda.situacoes.keys }

  def contato
    {nome: self.usuario.nome,
     email: self.usuario.email,
     telefone: self.usuario.telefone}
  end
  def endereco_entrega
    {rua: self.rua,
     bairro: self.bairro,
     cidade: self.cidade,
     uf: self.uf,
     numero: self.numero,
     cep: self.cep,
     complemento: self.complemento}
  end

  def descricao
    self.peca.descricao
  end

  def as_json(options={})
    super(root: true,
        methods: [:contato, :descricao, :endereco_entrega])
  end

end
