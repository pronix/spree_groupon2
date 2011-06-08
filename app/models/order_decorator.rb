# customize the checkout state machine
Order.state_machines[:state] = StateMachine::Machine.new(Order, :initial => 'cart', :use_transactions => false) do

  event :next do
    transition :from => 'cart', :to => 'payment'
    # note: some payment methods will not support a confirm step
    transition :from => 'payment',  :to => 'confirm',
    :if => Proc.new { Gateway.current && Gateway.current.payment_profiles_supported? }

    transition :from => 'payment', :to => 'complete'
    transition :from => 'confirm', :to => 'complete'
  end

  # after_transition :to => 'complete', :do => :complete_order
  # before_transition :to => 'complete', :do => :process_payment

end

Order.class_eval do

end
