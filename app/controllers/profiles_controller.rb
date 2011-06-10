class ProfilesController < Spree::BaseController
  include SpreeBase
  helper :users, 'spree/base'
  before_filter :load_states, :only=>[:edit, :update]

  def show
    @profile = Profile.find(params[:id])
  end


  def edit
    @profile = if params[:email]
       User.find_by_email(params[:email]).profile
    else
      Profile.find_by_id(current_user.id)
    end
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:notice] = I18n.t(:profile_updated_successfully)
    end
    redirect_to profile_path(@profile.id)
  end
  def subscription
    @profile = current_user.profile
    if request.post? && params[:profile] &&
        params[:profile][:subscription] &&
        @profile.update_attribute(:subscription, params[:profile][:subscription])
      redirect_to profiles_path
    else
      render :subscription
    end
  end
  private
  def load_states
    @states = State.all
  end

end
