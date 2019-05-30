class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :ensure_json_request, :configure_permitted_parameters, if: :devise_controller?

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
