class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_resource

  protected
  def current_resource
  	@current_resource ||= session[:type].try(:find_by_uid, session[:uid])
  end

  def authenticate_resource
  	if @current_resource
  		session[:uid] = nil
  		session[:type] = nil
  		redirect_to :root_path
  	end
  end
end
