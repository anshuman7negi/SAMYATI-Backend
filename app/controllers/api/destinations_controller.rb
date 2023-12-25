class Api::DestinationsController < ApplicationController
    def create_destination
        @destination = Destination.new(create_destination_parmas)

        if @destination.save
            render json: @destination, status: :created
        else
            render json: {errors: @destination.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private 

    def create_destination_parmas
        params.require(:destination).permit(:username, :country, :city, :location, :description)
    end
end
