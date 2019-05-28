class DemandasController < ApplicationController
  before_action :set_demanda, except: [:index, :create]

  def index
    @demandas = Demanda.all
    filter_by_situacao if params[:situacao]
    @demandas.any? ? render(json: @demandas.as_json) : render(json: @demandas)
  end

  def show
    render json: @demanda.as_json
  end

  def create
    @demanda = Demanda.new(demanda_params)
    @demanda.save ? render(json: @demanda.as_json, status: :created) :
        render(json: @demanda.errors, status: :unprocessable_entity)
  end

  def update
    @demanda.update(demanda_params) ? render(json: @demanda.as_json) :
        render(json: @demanda.errors, status: :unprocessable_entity)
  end

  def destroy
    render @demanda.errors unless @demanda.destroy
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
