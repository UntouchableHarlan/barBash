class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def sold_during_last_timer(drink)
    array = []
    drink.sales.where(created_at: (Bar.take.timer.seconds.ago..Time.now)).each {|sale| array << sale.quantity}
    @total_sales_for_last_timer = array.inject(0){|sum,x| sum + x }
  end
  helper_method :sold_during_last_timer

  private
  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end

  def require_owner
    redirect_to login_path flash.now[:error] = "Could not save client" unless current_owner
  end

  helper_method :current_owner
  helper_method :require_owner

end
