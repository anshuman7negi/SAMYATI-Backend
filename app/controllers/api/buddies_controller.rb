class BuddiesController < ApplicationController
    def find_buddy
        @find_buddy = Buddy.new(create_buddy_params)
        if @find_buddy.save
            render json:@find_buddy, status: :created
        else
            render json: {errors: @find_buddy.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
    
    def create_buddy_params
        params.require(:buddy).permit(:username, :image, :location, :description, :starting_journey_date, :reservation_closing_date, :total_seats)
    end
end
