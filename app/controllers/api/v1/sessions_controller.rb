# frozen_string_literal: true
module Api
  module V1
    class SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]


      # POST /resource
      def create
        user = warden.authenticate!(auth_options)
        if user
    	    user_details = {id: user.id, authentication_token: user.authentication_token, email: user.email, user_name: user.user_name, phone_number: user.phone_number}
    	    render json: { message: "User successfully logged in", user_details: user_details, status: 200 }
        else
        	render json: {message: "User not logging"}
        end
      end

      def destroy
        if current_user
          head :ok
        else
          render json: { error: 'invalid token' }, status: 401
        end
      end

      protected

      def verify_signed_out_user; end

      def resource_name
        :user
      end

    end
  end
end
