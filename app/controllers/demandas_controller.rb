class DemandasController < ApplicationController
  before_action :set_demanda, only: [:show, :destroy]

  def index
    @demandas = Demanda.all
    filter_by_situacao if params[:situacao]
    render json: @demandas
  end

  def show
    render json: @demanda
  end

  def create
    @demanda = Demanda.new(demanda_params)
    @demanda.save? ? render(json: @demanda, status: :created) :
        render(json: demanda.errors, status: :unprocessable_entity)
  end

  def destroy
    unless @demanda.destroy
      render @demanda.errors
    end
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
