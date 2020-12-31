module Api  
  module V1
    class RegistrationsController < Devise::RegistrationsController
      before_action :configure_permitted_parameters, only: [:create]
      skip_before_action :verify_authenticity_token


      # POST /resource
      def create
        ActiveRecord::Base.transaction do
          build_resource(sign_up_params)
          resource.save
          yield resource if block_given?
          unless resource.persisted?
            clean_up_passwords resource
            set_minimum_password_length
            return render json:{errors: resource.errors.as_json}
          end
          if resource.active_for_authentication?
            sign_up(resource_name, resource)
          else
            expire_data_after_sign_in!
          end
          @user = resource
          render json: { user: resource, status: :success, message: "User created successfully" }
        end
      end

      protected

      def configure_permitted_parameters
        param_keys = [:first_name, :last_name, :user_name, :company_name, :avatar, :email, :password, :phone_number, role_ids: [] ]
        devise_parameter_sanitizer.permit(:sign_up, keys: param_keys)
        # devise_parameter_sanitizer.permit(:account_update, keys: param_keys)
      end

      def resource_name
        :user
      end
    end
  end
end






