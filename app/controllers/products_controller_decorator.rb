ProductsController.class_eval do
  HTTP_REFERER_REGEXP = /^https?:\/\/[^\/]+\/t\/([a-z0-9\-\/]+)$/
  
  helper :locations
  before_filter :load_state
  def index
    @products = Product.find(:all, :conditions=>["available_till <= ? AND state_id = ?",Time.now, @state.id])
    render :index
  end
  
  def recently
    @products = Product.find(:all, :conditions=>["available_till <= ?",Time.now])
    render :index
  end

  def current
    @products = Product.find(:all, :conditions=>["available_till > ? AND available_on <= ?",Time.now, Time.now])
    render :index
  end
  
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
  
  private
  def load_state
    if current_user
      unless session[:state_id]
        @state = current_user.state
        session[:state_id]=@state.id
      else
        @state = State.find_by_id(session[:state_id])
      end
    else
      @state = State.first
    end    
  end

end
