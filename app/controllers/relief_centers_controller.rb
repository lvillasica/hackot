class ReliefCentersController < ApplicationController

  def index
    @relief_centers = ReliefCenter.all
  end

  def show
    @relief_center = ReliefCenter.find_by_id(params[:id])
    @event = @relief_center.events.build
  end

  def update
    @relief_center = ReliefCenter.find_by_id(params[:id])
    @relief_center.update_attributes(params[:relief_center].presence)

  def timesheet
  end
end