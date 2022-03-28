class ApplicationController < ActionController::Base
  before_action :config_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def set_locale
    if %w(ja en).include?(session[:locale])
      I18n.locale = session[:locale]
    end
  end
end
