class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def create
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :email, :kanji_last_name, :kanji_first_name, :kana_last_name,
                                             :kana_first_name, :birthday])
  end
end
