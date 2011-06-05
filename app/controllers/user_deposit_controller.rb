class UserDepositController < ApplicationController
  include SpreeBase
  helper :users, 'spree/base', :locations
  
  def new
    @payment_methods = PaymentMethod.all
  end




end
