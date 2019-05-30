class DemandasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_demanda, except: [:index, :create]

  def index
    authorize(Demanda)
    load_demandas
    paginate json: @demandas if stale?(etag: @demandas)
  end

  def show
    authorize(Demanda)
    render json: @demanda
  end

  def create
    authorize(Demanda)
    @demanda = Demanda.new(demanda_params)
    @demanda.save ? render(json: @demanda, status: :created) :
        render(json: @demanda.errors, status: :unprocessable_entity)
  end

  def update
    authorize(Demanda)
    @demanda.update(demanda_params) ? render(json: @demanda) :
        render(json: @demanda.errors, status: :unprocessable_entity)
  end

  def destroy
    authorize(Demanda)
    render @demanda.errors unless @demanda.destroy
  end

  private

  def set_demanda
    @demanda = policy_scope(load_demandas).find(params[:id])
  end

  def load_demandas
    @demandas = policy_scope(Demanda.all.page(params[:page]))
  end

  def load_demandas_usuario(usuario_param)
    Usuario.find(usuario_param).demandas
  end

  def load_demandas_peca(peca_param)
    Usuario.find(peca_param).demandas
  end

  def demanda_params
    params.require(:demanda).permit(:usuario_id, :peca_id, :rua, :bairro, :cidade,
                                    :uf, :numero, :cep, :complemento, :situacao)
  end
end
