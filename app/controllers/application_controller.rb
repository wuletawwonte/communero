class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?
  layout :layout_by_resource

  def layout_by_resource
    if (devise_controller? && resource_name == :user && action_name == 'new') ||
       (devise_controller? && resource_name == :user && action_name == 'create')
      'application'
    else
      'loggedin'
    end
  end


  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation,
               :current_password)
    end
  end
end
