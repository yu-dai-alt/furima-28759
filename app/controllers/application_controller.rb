class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    items_index_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email,:first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  end
end
