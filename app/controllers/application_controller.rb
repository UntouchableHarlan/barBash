class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end

  def require_owner
    redirect_to login_path flash.now[:error] = "Could not save client" unless current_owner
  end

  def get_time
    session[:start_time_min] = Time.now.min
    session[:start_time_hour] = Time.now.hour
  end



    helper_method :current_owner
    helper_method :get_time
    helper_method :new_price
  end
