class ReliefCentersController < ApplicationController

  def index
    @relief_centers = ReliefCenter.all
  end

  def show
    @relief_center = ReliefCenter.find_by_id(params[:id])
  end
end