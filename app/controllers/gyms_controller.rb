class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    gym = Gym.find(params[:id])
    render json: gym if gym
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.destroy
    head :no_content
  end

  private

  def handle_record_not_found(invalid)
    # byebug
    render json: { error: "record not found" }, status: :not_found
  end
end
