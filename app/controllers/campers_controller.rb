class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        render json: Camper.all, status: 200
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, serializer: CamperWithActivitySerializer, status: 200
        else
            render json: { error: "Camper not found" }, status: 404
        end
    end

    def create 
        camper = Camper.create!(name: params[:name], age: params[:age])
        render json: camper, status: 201
    end

    private

    def render_unprocessable_entity(invalid)
        render json: { errors: [invalid.message] }, status: 422
    end


end
