# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar username first_name last_name bio email password])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[avatar username first_name last_name email bio password])
  end
end
