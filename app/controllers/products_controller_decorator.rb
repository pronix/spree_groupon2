ProductsController.class_eval do

  before_filter :load_state

  def index
    @products = Product.available_coupon.for_state(@state.id)
    render :index
  end

  def featured
    @featured = Product.featured.for_state(@state.id)

    unless @current_feature = @featured.last
      redirect_to products_path and return
    end

    @products = Product.available_coupon.for_state(@state.id)

  end

  def recently
    @products = Product.recently_coupon.for_state(@state.id)
    render :index
  end

  def current
    @products = Product.available_coupon.for_state(@state.id)
    render :index
  end

  def change_state

  end

  def description
    @product = Product.find_by_permalink!(params[:id])
    render :layout => false
  end

  def conditions
    @product = Product.find_by_permalink!(params[:id])
    render :layout=> false
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
        session[:state_id] = @state.id
      end
      @state ||= State.find_by_id(session[:state_id])
    else
      @state = State.first
    end

  end

end
