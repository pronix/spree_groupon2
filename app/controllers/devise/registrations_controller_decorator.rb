Devise::RegistrationsController.class_eval do
  include SpreeBase
  helper :users, 'spree/base'
  before_filter :init_states, :only => :create

  private

  def init_states
    @states = Country.find_by_iso(params[:country].upcase).states
  end

end
