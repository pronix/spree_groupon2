class UserDepositController < ApplicationController
  helper :users, 'spree/base'

  def new
    @payment_methods = PaymentMethod.all
  end




end
