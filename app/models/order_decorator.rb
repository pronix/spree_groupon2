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
  before_create :generate_coupon_code
  def generate_coupon_code
    record = true
    while record
      random = Array.new(11){[('A'..'Z').to_a, (0..9).to_a].flatten.sample}.join
      record = self.class.where(:coupon => random).first
    end
    self.coupon ||= random
    self.coupon

  end
end
