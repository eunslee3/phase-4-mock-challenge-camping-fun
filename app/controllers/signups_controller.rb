class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create
        signup = Signup.create!(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
        render json: signup.activity, status: 201
    end

    private

    def render_unprocessable_entity(invalid)
        render json: { errors: [invalid.message] }, status: 422
    end
end
