UserMailer.class_eval do

  include Devise::Controllers::ScopedViews
  attr_reader :scope_name, :resource

  # Отправка инструкций подтверждения пароля
  def confirmation_instructions(record)
    setup_mail(record, :confirmation_instructions)
  end

  # Configure default email options
  def setup_mail(record, action)
    initialize_from_record(record)
    mail headers_for(action)
  end

  def initialize_from_record(record)
    @scope_name = Devise::Mapping.find_scope!(record)
    @resource   = instance_variable_set("@#{devise_mapping.name}", record)
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[scope_name]
  end

  def headers_for(action)
    headers = {
              :subject       => translate(devise_mapping, action),
              :from          => mailer_sender(devise_mapping),
              :to            => resource.email,
              :template_path => template_paths
              }

              if resource.respond_to?(:headers_for)
                headers.merge!(resource.headers_for(action))
              end

              unless headers.key?(:reply_to)
                headers[:reply_to] = headers[:from]
              end

              headers
  end


  def mailer_sender(mapping)
    if Devise.mailer_sender.is_a?(Proc)
      Devise.mailer_sender.call(mapping.name)
    else
      Devise.mailer_sender
    end
  end

  def template_paths
    template_path = [self.class.mailer_name]
    template_path.unshift "#{@devise_mapping.scoped_path}/mailer" if self.class.scoped_views?
    template_path
  end

end
