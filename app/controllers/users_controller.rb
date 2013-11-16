class UsersController < ApplicationController
  def index
    @users = User.all
    @event = Event.find_by_id(params[:event_id].to_i)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = current_resource
    @user.update_attributes(params[:user].presence)
  end
end