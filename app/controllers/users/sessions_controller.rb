class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # Re-creates the new action with @new_user instead of @user, to prevent confilct with the @user set by the application
   def new
      @new_user = User.new(sign_in_params)
      clean_up_passwords(resource)
      respond_with(@new_user, serialize_options(@new_user))
   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
