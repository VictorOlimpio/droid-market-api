class DemandasController < ApplicationController
  before_action :authenticate_usuario!#, only: [:index, :create, :update, :delete]
  before_action :set_demandas, only: [:index, :show]

  def index
    authorize(Demanda)
    paginate json: @demandas if stale?(etag: @demandas)
  end

  def show
    (params[:usuario_id] || params[:peca_id])? paginate(json: @demandas) :
        render(json: Demanda.find(params[:id]))
  end

  def create
    @demanda = Demanda.new(demanda_params)
    @demanda.save ? render(json: @demanda, status: :created) :
        render(json: @demanda.errors, status: :unprocessable_entity)
  end

  def update
    @demanda = Demanda.find(params[:id])
    @demanda.update(demanda_params) ? render(json: @demanda) :
        render(json: @demanda.errors, status: :unprocessable_entity)
  end

  def destroy
    @demanda = Demanda.find(params[:id])
    render @demanda.errors unless @demanda.destroy
  end

  private

  def set_demandas
    @demandas = Usuario.find(params[:usuario_id]).demandas if params[:usuario_id]
    @demandas = Peca.find(params[:peca_id]).demandas if params[:peca_id]
    @demandas = Demanda.all.page(params[:page]) unless (params[:usuario_id] || params[:peca_id])
  end

  def demanda_params
    params.require(:demanda).permit(:usuario_id, :peca_id, :rua, :bairro, :cidade,
                                    :uf, :numero, :cep, :complemento, :situacao)
  end
end
