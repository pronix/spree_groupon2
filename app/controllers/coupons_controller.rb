class CouponsController < Spree::BaseController
  include SpreeBase
  helper :users, 'spree/base', :locations
  before_filter :load_states, :only=>[:edit, :update]

  def index
    case params[:state].to_s
    when "all"
      @orders = current_user.orders.where(:"present_email" => nil).complete
    when "present"
      @orders = Order.where(:present_email => current_user.email, :gift_state => ["wait", "accepted"] ).complete
    else
      @orders = current_user.orders.where(:"present_email" => nil).complete
    end

  end

  def gift
    if @order = Order.where(:present_email => current_user.email,
                           :gift_state => ["wait", "accepted"],
                           :id => params[:id] ).first
      @order.accept_gift!
    end

    redirect_to coupons_path(:present), :notice => "Падарок принят"
  end
end
