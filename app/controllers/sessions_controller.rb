class SessionsController < ApplicationController
  before_filter :get_resource, :only => :create

  def create
    auth = request.env["omniauth.auth"]
    user = @resource.find_by_provider_and_uid(auth["provider"], auth["uid"].to_s) || @resource.create_from_auth(auth)
    session[:uid] = user.id
    render json: { :success => session[:uid].present? }
  end

  # def check
  #   if uid = session[:uid]
  #     @resource ||= @resource.find uid
  #     render json: @resource.to_json
  #   else
  #     render json: { :session => false }
  #   end
  # end

  def destroy
    session[:uid] = nil
    session[:type] = nil
    redirect_to :root
  end

  protected
  def get_resource
    type = request.env["omniauth.params"]["type"]
    if type.present?
      @resource = session[:type] = type.camelize.constantize
    else
      render json: { :error => "User type not found!" }
      return
    end

  rescue NameError => e
    render json: { :error => "User type not found!" }
    return
  end
end
