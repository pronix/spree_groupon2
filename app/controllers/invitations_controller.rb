class InvitationsController < Devise::InvitationsController
  include SpreeBase
  helper :locations
  helper :users, 'spree/base'
  layout "groupon_application"
  before_filter :load_state
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
