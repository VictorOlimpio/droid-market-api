module Destruidor
  class Peca
    include ActiveModel::Validations
    attr_reader :peca, :demanda

    validates :peca, presence: true
    validate :peca_destruida, :demandas_destruidas

    def initialize(peca)
      @peca = peca
      @demandas = peca.demandas
    end

    def salvar
      destroi_peca
      errors.empty?
    end

    private

    def destroi_peca
      destroi_peca_e_demanda
    end

    def destroi_peca_e_demanda
      ActiveRecord::Base.transaction do
        @peca.destroy
        @demandas.destroy_all
        raise ActiveRecord::Rollback unless valid?
      end
    end

    def peca_destruida
      errors.add(:base, 'Erro ao destruir a peca') unless @peca.destroyed?
    end

    def demandas_destruidas
      errors.add(:base, 'Erro ao destruir a demanda') if @demandas.any?
    end
  end
end