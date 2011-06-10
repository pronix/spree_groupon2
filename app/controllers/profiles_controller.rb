class ProfilesController < Spree::BaseController
  helper :users, 'spree/base'
  before_filter :load_states, :only=>[:edit, :update]

  def show
    @profile = current_user.profile
  end


  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
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
