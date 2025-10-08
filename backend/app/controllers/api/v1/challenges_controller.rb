module Api
  module V1
    class ChallengesController < ApplicationController
        
        # GET api/v1/challenges
        def index
            @challenges = Challenge.all
            render json: @challenges
        end

        # POST api/v1/challenges
        def create
            challenge = Challenge.new(
                title: 'VTTN', 
                description: 'New description', 
                start_date: Date.today, 
                end_date: Date.tomorrow
            )
            if challenge.save
                render json: { message: 'Challenge added successfully', data: challenge }
            else
                render json: { message: 'Failed to add challenge', data: challenge.errors }
            end
        end

        # GET api/v1/challenges/:id
        def show
        end

        # PATCH/PUT api/v1/challenges/:id
        def update
        end
        
        # DELETE api/v1/challenges/:id
        def destroy
        end
    end
  end
end    