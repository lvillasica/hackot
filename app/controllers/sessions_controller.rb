class SessionsController < ApplicationController
  before_filter :get_resource

  def create
    auth = request.env["omniauth.auth"]
    user = @resource.find_by_provider_and_uid(auth["provider"], auth["uid"].to_s) || @resource.create_from_auth(auth)
    session[:uid] = user.id
    render json: { :success => session[:uid].present? }
  end

  def check
    if uid = session[:uid]
      @resource = Greeter.find uid
      render json: @resource.to_json
    else
      render json: { :session => false }
    end
  end

  def destroy
    session[:uid] = nil
    render json: { :session => false }
  end

  protected
  def get_resource
    type = request.env["omniauth.params"]["type"]
    if type.present?
      @resource = type.camelize.constantize
    else
      render json: { :error => "User type not found!" }
      return
    end
  end
end
