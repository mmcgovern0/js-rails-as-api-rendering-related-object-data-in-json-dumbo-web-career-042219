class SightingsController < ApplicationController
    
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

    # def show
    #     sighting = Sighting.find(params[:id])
    #     render json: sighting
    # end

    # def show
    #     sighting = Sighting.find(params[:id])
    #     render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    # end

    # def show
    #     sighting = Sighting.find(params[:id])
    #     render json: sighting, include: [:bird, :location]
    # end

    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     if sighting
    #       render json: sighting.to_json(include: [:bird, :location])
    #     else
    #       render json: { message: 'No sighting found with that id' }
    #     end
    # end

    def show
        sighting = Sighting.find(params[:id])
        render json: sighting.to_json(:include => {
            :bird => {
                :only => [:name, :species]
            },
            :location => {
                :only => [:longitude, :latitude]
            }
        }, :except => [:updated_at])
    end

end
