# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  private

  def auth_admin
    if user_signed_in? && current_user.role == "Merchant"
      flash[:notice] = "Only Admin can edit or add Products"
      redirect_to root_path
    end
  end
end
