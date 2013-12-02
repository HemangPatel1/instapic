class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters, :only => [:create, :edit, :update]


  protected

    def after_update_path_for(resource)
      edit_user_registration_path(resource)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :avatar) }
	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :current_password, :password, :password_confirmation, :avatar) }
    end

end