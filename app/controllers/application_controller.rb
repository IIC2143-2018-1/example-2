class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :cofigure_permitted_parameters, if: :devise_controller?

  protected

    def cofigure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name email])
    end
end
