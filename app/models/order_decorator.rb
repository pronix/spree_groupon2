# customize the checkout state machine
Order.state_machines[:state] = StateMachine::Machine.new(Order, :initial => 'cart', :use_transactions => false) do

  event :next do
    transition :from => 'cart', :to => 'present'
    transition :from => 'present', :to => 'payment'

    transition :from => 'cart', :to => 'payment'
    # note: some payment methods will not support a confirm step
    transition :from => 'payment',  :to => 'confirm',
    :if => Proc.new { Gateway.current && Gateway.current.payment_profiles_supported? }

    transition :from => 'payment', :to => 'complete'
    transition :from => 'confirm', :to => 'complete'
  end

  after_transition  :to => 'complete',   :do => :finalize!

  after_transition  :to => 'canceled', :do => :after_cancel
  before_transition :to => 'complete' do |order|
    begin
      order.process_payments!
    rescue Spree::GatewayError
      if Spree::Config[:allow_checkout_on_gateway_error]
        true
      else
        false
      end
    end
  end


  after_transition :to => 'complete', :do => :send_gift!, :unless => lambda{|t| t.present_email.blank? }
end


Order.class_eval do
  belong_to :author_coupon, :class_name => "User"
  state_machine :gift_state, :initial => 'no_gift', :use_transactions => false, :namespace => 'gift' do

    event :send do
      transition :from => 'no_gift', :to => 'wait'
    end

    event :gift_accept do
      transition :from => 'wait', :to => 'accepted'
    end

    event :reject do
      transition :from => 'wait', :to => 'rejected'
    end

    after_transition :to => 'wait', :do => :send_present
    before_transition :to => 'accepted', :do => :change_user
  end

  # Отравляем писмьо получателю подарка
  #
  def send_present

  end

  # Устанавливаем пользователя для купона
  #
  def change_user
    self.author_coupon = self.user
    self.user = User.find_by_email(self.present_email)
  end

  before_create :generate_coupon_code
  def generate_coupon_code
    record = true
    while record
      random = Array.new(11){[ ('A'..'Z').to_a, (0..9).to_a ].flatten.sample}.join
      record = self.class.where(:coupon => random).first
    end
    self.coupon ||= random
    self.coupon

  end

  def in_present?
    !present_email.blank?
  end

end
