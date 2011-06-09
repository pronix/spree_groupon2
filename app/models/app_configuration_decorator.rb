AppConfiguration.class_eval do
  preference :logo, :string, :default=>"/images/logo.png"
  preference :allow_guest_checkout, :boolean, :default => false
end
