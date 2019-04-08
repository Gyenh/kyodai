class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

# Permet de cacher la navbar sur la page d'accueil
  before_action :show_navbar

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def show_navbar
    @show_navbar = true
  end

end
