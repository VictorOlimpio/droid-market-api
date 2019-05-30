class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_json_request

  def pundit_user
    current_usuario
  end

  def ensure_json_request
    return if request.headers["Accept"] =~ /json/
    render :nothing => true, :status => 406
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :email, :telefone, :tipo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :telefone, :tipo])
  end
end
