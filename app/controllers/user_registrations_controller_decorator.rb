UserRegistrationsController.class_eval do 
  before_filter :init_regions, :only => [:new]

  # Подтверждение мобильного
  def confirm_phone
    if params[:phone_confirm]
      user = User.find_by_email(params[:email])
      puts "1111111111111111111111111111111"
      puts user.phone_confirm?
      redirect_to root_path, :notice => t("notices.phone_confirm_was_confirmed") if user.phone_confirm?
      if user.phone_confirm_key == params[:phone_confirm]
        user.phone_confirm!
        redirect_to root_path, :notice => t("notices.successfully_phone_confirm")
      else
         flash[:notice] = t("notices.not_successfully_phone_confirm")
      end
    end
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
      @states = State.find(params[:user][:state_id]).countries.regions
      clean_up_passwords(resource)
      render_with_scope(:new)
    end
  end

  private

  def init_regions
    @states = Country.find_by_iso("RU").states
  end

end

