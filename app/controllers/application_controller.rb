class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :config_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  protected
#サインイン、サインアウト後の遷移先をtopページに設定
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
# ユーザー情報にユーザー名を追加
  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private
#言語設定を認識
  def set_locale
    if %w(ja en).include?(session[:locale])
      I18n.locale = session[:locale]
    end
  end
end
