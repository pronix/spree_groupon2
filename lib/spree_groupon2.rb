require 'spree_core'
require 'spree_groupon2_hooks'

module SpreeGroupon2
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      Order.class_eval do
        # customize the checkout state machine
        Order.state_machines[:state] = StateMachine::Machine.new(Order, :initial => 'cart') do
          after_transition :to => 'complete', :do => :complete_order
          before_transition :to => 'complete', :do => :process_payment
          event :next do
            transition :from => 'cart', :to => 'payment'
            transition :from => 'payment', :to => 'confirm'
            transition :from => 'confirm', :to => 'complete'
#            transition :from => 'cart', :to => 'delivery'
#            transition :from => 'delivery', :to => 'payment'
#            transition :from => 'payment', :to => 'confirm'
#            transition :from => 'confirm', :to => 'complete'
          end

           #
           # YOU MUST ALSO DEFINE OTHER EVENTS, TRANSITIONS AND CALLBACKS
           #

        end
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
