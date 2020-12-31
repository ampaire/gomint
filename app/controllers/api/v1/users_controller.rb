module Api
  module V1
    class UsersController <  ApplicationController
      before_action :authenticate_user!
      before_action :find_user, except: [:index, :forgot_password ]

    	def index
    		users = User.all
    		if users.present?
          render json:  {users: users, status: :success, message: "Users found successfully"}
        else
          render json:  {users: [], status: :success, user: "User not found"}
        end
    	end

    	def show
    		if @user.present?
          render json:  {user: @user, status: :success, message: "User found successfully"}
        else
          render json:  {user: [], status: :success, user: "User not found"}
        end
    	end

    	def update
        if @user && @user.update_attributes(user_params)
          render json:  {user: user, status: :success, message: "User updated successfully"}
        else
          render json:  {user: [], status: :success, message: "Failed to update user"}
        end
    	end

    	def destroy
    		if @user.present? && @user.destroy
          render json:  {status: :success, message: "User successfully deleted"}
        else
          render json:  {message: "Failed to delete the user"}
        end
    	end

      def forgot_password
        if @user = User.find_by(email: params[:email])
          render json:  {status: :success, message: "User forgot password email successfully sent"}
        else
          render json:  {message: "User not found"}
        end
      end

    	private

      def find_user
        @user = User.find_by(id: params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :company_name, :avatar)
      end

    end
  end
end
