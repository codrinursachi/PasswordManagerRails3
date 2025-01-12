class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_locale
  private
    def set_locale
      if I18n.available_locales.include?(params[:locale]&.to_sym)
        I18n.locale = params[:locale]
      else
        redirect_to "/#{I18n.default_locale}"
      end
    end
    def default_url_options
      { locale: I18n.locale }
    end
    def current_user
      Current.user
    end
end
