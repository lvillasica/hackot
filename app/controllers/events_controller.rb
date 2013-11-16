class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  def create
    @event = current_resource.create(params[:event])
  end

  def update
    @event = Event.find_by_id(params[:id])
    @event.update_attributes(params[:event].presence)
  end
end