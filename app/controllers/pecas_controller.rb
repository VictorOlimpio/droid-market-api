class PecasController < ApplicationController
  before_action :set_peca, except: [:index, :create]

  def index
    @pecas = Peca.all.page(params[:page])
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

  def update
    @peca.update(peca_params) ? render(json: @peca) :
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

  def peca_params
    params.require(:peca).permit(:tipo, :descricao, :valor)
  end
end
