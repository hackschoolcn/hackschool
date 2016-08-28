class RegistrationsController < Devise::RegistrationsController
  # POST /resource

  def create
    build_resource(sign_up_params)
    if resource.save
      # this block will be used when user is saved in database

      if resource.active_for_authentication?
        # this block will be used when user is active or not required to be confirmed

        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        # this block will be used when user is required to be confirmed

        user_flash_msg if is_navigational_format? #created a custom method to set flash message

        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      # this block is used when validation fails

      clean_up_passwords resource
      respond_with resource
    end
  end

  private

  # set custom flash message for unconfirmed user

  def user_flash_msg
    if resource.inactive_message == :unconfirmed
      #check for inactive_message and pass email variable to devise locals message

      set_flash_message :notice, :"signed_up_but_unconfirmed", email: resource.email
    else
      set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}"
    end
  end
end
