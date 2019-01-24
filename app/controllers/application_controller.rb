class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :authenticate_user!, only: [:create,:edit,:update,:destroy,:index]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  # sign_in後のリダイレクト先
  def after_sign_in_path_for(resource)
    flash[:notice] = "You have successfully logged in."
    user_path(resource)
  end

  # sign_out後のリダイレクト先
  def after_sign_out_path_for(resource)
    flash[:notice] = "You have successfully logged out."
    root_path
  end

end