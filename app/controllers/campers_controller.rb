class CampersController < ApplicationController
       # # TODO: fix, currently returns null instead of error 
    # rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
    
    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, include: :activities
        else
            render json: { error: "Camper not found"}, status: :not_found
        end
    end

    def create
        camper = Camper.create(params.permit(:name, :age))
        if camper.valid?
            render json: camper, status: :created
        else
            render json: { errors: ["validation errors"] }, status: :unprocessable_entity
        end
    end

    private
    # # TODO: fix, currently returns null instead of error 
    # def camper_not_found
    #     render json: { error: "Camper not found" }, status: :camper_not_found
    # end
 
end
