Devise::ConfirmationsController.class_eval do
  after_filter :send_new_password, :only=>"show"
  
  def send_new_password
    if resource.confirmed?
      resource.generate_new_password
      
    end
  end
end
