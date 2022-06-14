class MembershipsController < ApplicationController
  def create
    membership = Membership.create!(permitted_params)
    render json: membership
  end

  private

  def permitted_params
    params.permit(:gym_id, :client_id, :charge)
  end
end
