class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  def show
    client = Client.find(params[:id])
    render json: client #, include: :gyms
  end

  private

  def handle_record_not_found(invalid)
    # byebug
    render json: { error: "record not found" }, status: :not_found
  end
end
