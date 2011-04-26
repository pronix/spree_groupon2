UserRegistrationsController.class_eval do 
  before_filter :init_regions, :only => [:new]

  def confirm_phone
    @user = User.find_by_email(params[:email])
  end

  def create
    @user = build_resource(params[:user])
    logger.debug(@user)
    if resource.save
      set_flash_message(:notice, :signed_up)
      redirect_to user_confirm_phone_url(:email => resource.email)
#      sign_in_and_redirect(:user, @user)
    else
      puts "22222222222222222222222222222222222222"
      @regions = Region.find(params[:user][:region_id]).countries.regions
      clean_up_passwords(resource)
      render_with_scope(:new)
    end
  end

  private

  def init_regions
    @regions = Country.find_by_iso("RU").regions
  end

end

