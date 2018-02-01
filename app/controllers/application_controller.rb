class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #find last universal ancestor
  helper_method :find_lua

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :nickname])
  end

  def find_lua(object)
    if object.is_a?(Comment)
      puzzle = find_lua(object.commentable)
    else
      puzzle = object
    end
    puzzle
  end

end
