class SmsMailer < ActiveRecord::Base
  
  def initialize options = {}
    @gateway = ActiveSmsgate::Gateway.gateway('qtelecom').new(:login => '13560', :password => 'Gimler12', :ssl=>true)
  end

  def self.deliver_sms
    @gateway.deliver_sms(:phones=>params[:phone], :message=>"Hello there")
  end


end
