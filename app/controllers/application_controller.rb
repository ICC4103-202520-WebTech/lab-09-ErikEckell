class ApplicationController < ActionController::Base
  # Evita ataques CSRF (por defecto en Rails 8, pero explícito es mejor)
  protect_from_forgery with: :exception

  # Manejo de errores de autorización de CanCanCan
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to recipes_path, alert: "You are not authorized to perform this action."
  end

  # Permite optimizaciones para navegadores modernos (Rails 8 feature)
  allow_browser versions: :modern
end
