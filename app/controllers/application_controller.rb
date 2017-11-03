require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit( :sign_in , keys: [ :full_name, :username, :birthday, :address, :city, :state, :country ] )
    devise_parameter_sanitizer.permit( :sign_up , keys: [ :full_name ,:username, :birthday, :address, :city, :state, :country ] )
    devise_parameter_sanitizer.permit( :account_update , keys: [:year, :full_name, :birthday, :address, :city, :state, :country ] )
  end
end
