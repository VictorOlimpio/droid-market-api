class UsuariosController < ApplicationController
  before_action :set_usuario, only: :show

  def index
    @usuarios = Usuario.all.order(:nome)
    render json: @usuarios
  end

  def show
    render json: @usuario
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :cpf, :telefone, :email, :tipo)
  end
end