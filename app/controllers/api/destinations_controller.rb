class Api::DestinationsController < ApplicationController

    def display_destinations
        @destinations = Destination.all.order(created_at: :desc)
        render json: @destinations
    end
    
    def create_destination
        @destination = Destination.new(create_destination_parmas)

        if @destination.save
            @destinations = Destination.all.order(created_at: :desc)
            render json: @destinations, status: :created
        else
            render json: {errors: @destination.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def delete_destination
        @destination = Destination.find(params[:id])
        if @destination.destroy
            @destinations = Destination.all.order(created_at: :desc)
            render json: @destinations, status: :ok
        else
            render json: { error: 'destination not found' }, status: :not_found
        end
    end

    private 

    def create_destination_parmas
        params.require(:destination).permit(:destination_name, :image, :location, :experience, :youtube_video_link, :total_cost)
    end
end
