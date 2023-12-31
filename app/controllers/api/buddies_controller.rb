class Api::BuddiesController < ApplicationController

    def display_buddies
        @buddies = Buddy.all.order(created_at: :desc)
        render json:@buddies
    end

    def find_buddy
         @buddies = Buddy.all.order(created_at: :desc)
        @find_buddy = Buddy.new(create_buddy_params)
        if @find_buddy.save
            render json:@buddies, status: :created
        else
            render json: {errors: @find_buddy.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def delete_buddy
        @buddy = Buddy.find(params[:id])
        if @buddy.destroy
            @buddies = Buddy.all.order(created_at: :desc)
         render json:@buddies, status: :ok
        else
            render json: { error: 'Buddy not found' }, status: :not_found
        end
    end

    private
    
    def create_buddy_params
        params.require(:findbuddy).permit(:username, :image, :location, :description, :starting_journey_date, :reservation_closing_date, :total_seats)
    end
end
