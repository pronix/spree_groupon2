AppConfiguration.class_eval do
  preference :logo, :string, :default=>"/images/logo.png"
  preference :allow_guest_checkout, :boolean, :default => false
  preference :twitter_account,   :string, :default=> "http://twitter.com/spree_groupon"
  preference :facebook_account,  :string, :default=> "http://facebook.com/SpreeGroupon"
  preference :vkontakte_account, :string, :default=> "http://vkontakte.ru/SPreeGroupon"
end
