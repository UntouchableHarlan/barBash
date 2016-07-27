class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end
  def require_owner
    redirect_to login_path flash.now[:error] = "Could not save client" unless current_owner
  end

  helper_method :current_owner
end
