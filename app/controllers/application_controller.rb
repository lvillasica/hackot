class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_resource, :is_rc?, :is_user, :index_path

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

  def index_path
    if current_resource
      if is_rc?
        relief_center_path(current_resource.id)
      else
        user_path(current_resource.id)
      end
    else
      root_path
    end
  end

  def is_rc?
    session[:type] == ReliefCenter
  end

  def is_user?
    session[:type] == User
  end
end
