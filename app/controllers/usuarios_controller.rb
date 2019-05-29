class UsuariosController < ApplicationController
  before_action :set_usuario, except: [:index, :create]

  def index
    @usuarios = Usuario.all.order(:nome).page(params[:page])
    paginate json: @usuarios
  end

  def show
    render json: @usuario
  end

  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.save ? render(status: :created) :
        render(json: @usuario.errors, status: :unprocessable_entity)
  end

  def update
    @usuario.update(usuario_params) ? render(json: @usuario) :
        render(json: @usuario.errors, status: :unprocessable_entity)
  end

  def destroy
    destruidor = Destruidor::Usuario.new(@usuario)
    render json: destruidor.errors unless destruidor.salvar
  end

  private

  def set_usuario
    if params[:demanda_id]
      @usuario = Demanda.find(params[:demanda_id]).usuario
      return @usuario
    end
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :telefone, :email, :tipo)
  end
end