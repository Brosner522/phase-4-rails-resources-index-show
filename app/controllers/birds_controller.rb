class BirdsController < ApplicationController

    def index
        # get all birds from data base and render as json data
        birds = Bird.all
        render json: birds
    end

    def show 
        # find one bird using the ID
        bird = Bird.find_by(id: params[:id])
        # if that bird is found, render it
        if bird 
            render json: bird
        # if bird is not found, send back custom error message with HTTP status
        else
            render json: { error: "Bird not found" }, status: :not_found
        end
    end

end
