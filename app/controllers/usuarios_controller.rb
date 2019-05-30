class UsuariosController < ApplicationController
  before_action :set_usuario, except: [:index, :create]

  def index
    @usuarios = Usuario.all.order(:nome).page(params[:page])
    paginate json: @usuarios, include: [:demandas]
  end

  def show
    render json: @usuario, include: [:demandas]
  end

  def update
    @usuario.update(usuario_params) ? render(json: @usuario, include: [:demandas]) :
        render(json: @usuario.errors, status: :unprocessable_entity)
  end

  def destroy
    destruidor = Destruidor::Usuario.new(@usuario)
    render json: destruidor.errors unless destruidor.salvar
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :telefone, :email, :tipo)
  end
end