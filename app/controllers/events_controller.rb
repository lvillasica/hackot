class EventsController < ApplicationController
  def index
    @events = Events.all
  end

  def show
    @event = Event.find_by_id(params[:id])
  end
end