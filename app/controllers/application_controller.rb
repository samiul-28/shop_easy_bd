class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include Pundit

  # Handle unauthorized access gracefully
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end

  
  before_action :set_locale

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    # To keep locale in URLs
    def default_url_options
      { locale: I18n.locale }
    end

end
