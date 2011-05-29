Devise::ConfirmationsController.class_eval do
  after_filter :send_new_password, :only=>"show"
  
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with_navigational(resource){ redirect_to '/' }
    else
      respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render_with_scope :new }
    end
  end

  def send_new_password
    if resource.confirmed?
      resource.generate_new_password
    end
  end
end
