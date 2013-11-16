class EventsController < ApplicationController
  def index
  	@events = if params[:relief_center_id].present?
  		ReliefCenter.find_by_id(params[:relief_center_id].to_i).try(:events)
  	else
    	Event.all
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  def create
    @event = current_resource.events.create(params[:event])
  end

  def update
    @event = Event.find_by_id(params[:id])
    @event.update_attributes(params[:event].presence)
  end

  def timein
    @user = User.find_by_id(params[:user_id])
    @user.update_attribute(:relief_center_id, current_resource.id)
  end

  def timeout
    @user = User.find_by_id(params[:user_id])
    @user.update_attribute(:relief_center_id, nil)
  end
end