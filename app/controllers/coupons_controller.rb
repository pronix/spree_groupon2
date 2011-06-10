class CouponsController < Spree::BaseController
  include SpreeBase
  helper :users, 'spree/base'
  before_filter :load_states, :only=>[:edit, :update]

  def index
    @orders =
      case params[:state].to_s
      when "all"
        current_user.orders.where( :present_email => nil ).complete
      when "present"
        Order.where(:present_email => current_user.email, :gift_state => ["wait", "accepted"] ).complete
      else
        current_user.orders.joins(:line_items => {:variant => :product}).
          where(:"present_email" => nil).complete.where("products.available_till >= ?", Time.now)
      end

  end

  # Принимаем купон в подарок
  #
  def gift
    if @order = Order.where(:present_email => current_user.email,
                           :gift_state => ["wait", "accepted"],
                           :id => params[:id] ).first
      @order.accept_gift!
    end

    redirect_to coupons_path(:present), :notice => "Падарок принят"
  end
end
