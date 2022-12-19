class CampersController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def index
        campers = Camper.all 
        render json: campers, include: ['id', 'name', 'age']
    end

    def show
    camper = find_camper
    render json: camper, serializer: CamperSerializer
    rescue ActiveRecord::RecordNotFound
        render json: {error: "Camper not found" }, status: :not_found
    end

    def create
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end

    private

    # def render_error_camper_not_found(invalid)
    #     render json: {error: "Camper not found" }
    # end

    def find_camper
    camper = Camper.find(params[:id])
    end

    def camper_params
    params.permit(:name, :age)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
