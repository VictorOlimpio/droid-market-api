class DemandasControllerController < ApplicationController
  before_action :set_demanda, only: :show

  def index
    @demandas = Demanda.all
    filter_by_situacao if params[:situacao]
    render json: @demandas
  end

  def show
    endereco_entrega = {rua: @demanda.rua,
                        bairro: @demanda.bairro,
                        cidade: @emanda.cidade,
                        uf: @demanda.uf,
                        cep: @demanda.cep}
    render json: @demanda
  end

  def create
    demanda = Demanda.new(demanda_params)
    demanda.save? ? render json: @demanda : render json: demanda.errors
  end

  private

  def set_demanda
    @demanda = Demanda.find(params[:id])
  end

  def demanda_params
    params.require(:demanda).permit(:usuario_id, :peca_id, :rua, :bairro, :cidade,
                                    :uf, :numero, :cep, :complemento, :situacao)
  end
end
