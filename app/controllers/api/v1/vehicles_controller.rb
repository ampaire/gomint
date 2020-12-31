module Api
  module V1
    class VehiclesController <  ApplicationController
      before_action :authenticate_user!
      before_action :find_vehicle, only: [:update, :show, :destroy ]

    	def index
    		vehicles = Vehicle.all
    		if vehicles.present?
          render json:  {vehicles: vehicles, status: :success, message: "Vehicles found successfully"}
        else
          render json:  {vehicles: [], status: :success, user: "Vehicle not found"}
        end
    	end

      def create
        vehicle = Vehicle.new(vehicle_params)
        if vehicle.save
          render json:  {vehicle: vehicle, status: :success, message: "vehicle created successfully"}
        else
          render json:  {vehicle: [], message: "vehicle not created", status: :unprocessable_entity}
        end
      end

    	def show
    		if @vehicle.present?
          render json:  {vehicle: @vehicle, status: :success, message: "Vehicle found successfully"}
        else
          render json:  {vehicle: [], status: :success, user: "Vehicle not found"}
        end
    	end

    	def update
        if @vehicle && @vehicle.update_attributes(vehicle_params)
          render json:  {vehicle: @vehicle, status: :success, message: "Vehicle updated successfully"}
        else
          render json:  {vehicle: [], status: :success, message: "Failed to update Vehicle"}
        end
    	end

    	def destroy
    		if @vehicle.present? && @vehicle.destroy
          render json:  {status: :success, message: "Vehicle successfully deleted"}
        else
          render json:  {message: "Failed to delete the Vehicle"}
        end
    	end

    	def show_vehicle_by_user
        vehicle = Vehicle.where(user_id: params[:user_id])
    		if vehicle.present?
          render json:  {vehicle: vehicle, status: :success, message: "Vehicle found successfully"}
        else
          render json:  {vehicle: [], status: :success, user: "Vehicle not found"}
        end
    	end

    	private

      def find_vehicle
        @vehicle = Vehicle.find_by(id: params[:id])
      end

      def vehicle_params
        params.require(:vehicle).permit(:user_id, :chassis, :model, :title, :manufacturing_date, :avatar)
      end
    end
  end
end







