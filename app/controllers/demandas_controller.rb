class DemandasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_demanda, except: [:index, :create]
  before_action :set_demandas, only: [:index, :show]

  def index
    paginate json: @demandas
  end

  def show
    (params[:usuario_id] || params[:peca_id])? paginate(json: @demandas) :
        render(json: @demanda)
  end

  def create
    @demanda = Demanda.new(demanda_params)
    @demanda.save ? render(json: @demanda, status: :created) :
        render(json: @demanda.errors, status: :unprocessable_entity)
  end

  def update
    @demanda.update(demanda_params) ? render(json: @demanda) :
        render(json: @demanda.errors, status: :unprocessable_entity)
  end

  def destroy
    render @demanda.errors unless @demanda.destroy
  end

  private

  def set_demanda
    @demanda = Demanda.find(params[:id]) unless (params[:usuario_id] || params[:peca_id])
  end

  def set_demandas
    if params[:usuario_id]
      @demandas = Usuario.find(params[:usuario_id]).demandas
      return @demandas
    end
    if params[:peca_id]
      @demandas = Peca.find(params[:peca_id]).demandas
      return @demandas
    end
    @demandas = Demanda.all.page(params[:page])
  end

  def demanda_params
    params.require(:demanda).permit(:usuario_id, :peca_id, :rua, :bairro, :cidade,
                                    :uf, :numero, :cep, :complemento, :situacao)
  end
end
