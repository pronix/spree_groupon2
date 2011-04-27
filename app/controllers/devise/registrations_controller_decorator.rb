Devise::RegistrationsController.class_eval do
  include SpreeBase
  helper :users, 'spree/base'
  before_filter :init_states, :only => :create

  def create
    @user = build_resource(params[:user])
    logger.debug(@user)
    if resource.save
      set_flash_message(:notice, :signed_up)
      redirect_to user_confirm_phone_url(:email => resource.email)
#      sign_in_and_redirect(:user, @user)
    else
      @states = State.find(params[:user][:state_id]).country.states
      clean_up_passwords(resource)
      render_with_scope(:new)
    end
  end

  private

  def init_states
    @states = Country.find_by_iso(params[:country].upcase).states
  end

end
