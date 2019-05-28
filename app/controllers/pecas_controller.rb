class PecasController < ApplicationController
  before_action :set_peca, only: [:show, :destroy]

  def index
    @pecas = Peca.all
    render json: @pecas
  end

  def show
    render json: @peca
  end

  def create
    @peca = Peca.new(peca_params)
    @peca.save ? render(json: @peca, status: :created) :
        render(json: @peca.errors, status: :unprocessable_entity)
  end

  def destroy
    destruidor = Destruidor::Peca.new(@peca)
    render json: destruidor.errors unless destruidor.salvar
  end

  private

  def set_peca
    @peca = Peca.find(params[:id])
  end

  def load_demandas
    demandas = @peca.demandas if @peca.demandas.any?
  end

  def peca_params
    params.require(:peca).permit(:tipo, :descricao, :valor)
  end
end
