OrdersController.class_eval do
  helper :locations
  
  def edit
    @order = current_order(true)
  end


end
