class Demanda < ApplicationRecord

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

  def descricao
    self.peca.descricao
  end

  def as_json(options={})
    super(root: true,
        methods: [:contato, :descricao])
  end

end
