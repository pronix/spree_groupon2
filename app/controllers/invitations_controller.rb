class InvitationsController < Devise::InvitationsController
  include SpreeBase
  helper :users, 'spree/base'
  layout "groupon_application"
end
