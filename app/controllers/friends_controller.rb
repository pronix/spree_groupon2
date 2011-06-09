class FriendsController < Spree::BaseController

  include SpreeBase
  helper :users, 'spree/base', :locations
  before_filter :load_states, :only=>[:edit, :update]

  def index
    @friends = current_user.friends
  end

end
