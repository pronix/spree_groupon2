ProductsController.class_eval do
  HTTP_REFERER_REGEXP = /^https?:\/\/[^\/]+\/t\/([a-z0-9\-\/]+)$/
#  def index
#    @products = Product.find_all_in_state('moscow')
#    respond_with(@products)
#  end
  
  
  def change_state
    
  end

  def description
    @product = Product.find_by_permalink!(params[:id])    
    render :layout=>false
  end

  def conditions
    @product = Product.find_by_permalink!(params[:id])    
    render :layout=>false
  end
  
  def comments
    @product = Product.find_by_permalink!(params[:id])
    render :layout=>false
  end
  
  def add_comment
    @product = Product.find_by_permalink!(params[:id])    
    render :layout=>false
  end

  def update
    @product = Product.find_by_permalink!(params[:id])
    Comment.create({
      :description => params[:product][:comment][:description], 
      :product_id => @product.id,
      :user_id => current_user.id
    })
    render :layout=>false
  end

end
