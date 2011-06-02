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
        state_machines[:state] = StateMachine::Machine.new(Order, :initial => 'cart', :use_transactions => false) do
          event :next do
            transition :from => 'cart',     :to => 'payment'
      #      transition :from => 'address',  :to => 'delivery'
      #      transition :from => 'delivery', :to => 'payment'
            transition :from => 'confirm',  :to => 'complete'

            # note: some payment methods will not support a confirm step
            transition :from => 'payment',  :to => 'confirm',
                                            :if => Proc.new { Gateway.current && Gateway.current.payment_profiles_supported? }

            transition :from => 'payment', :to => 'complete'
          end

          event :cancel do
            transition :to => 'canceled', :if => :allow_cancel?
          end
          event :return do
            transition :to => 'returned', :from => 'awaiting_return'
          end
          event :resume do
            transition :to => 'resumed', :from => 'canceled', :if => :allow_resume?
          end
          event :authorize_return do
            transition :to => 'awaiting_return'
          end

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

          after_transition :to => 'complete', :do => :finalize!
      #    after_transition :to => 'delivery', :do => :create_tax_charge!
      #    after_transition :to => 'payment', :do => :create_shipment!
          after_transition :to => 'canceled', :do => :after_cancel
        end
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
