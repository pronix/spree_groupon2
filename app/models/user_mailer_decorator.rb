UserMailer.class_eval do
  helper "spree/base"
  default_url_options[:host] = Spree::Config[:site_url]
  include Devise::Controllers::ScopedViews
  attr_reader :scope_name, :resource

  def subscription_coupons(user, current_coupon, coupons)
    @user, @current_coupon, @coupons = user, current_coupon, coupons
    mail(:subject => current_coupon.try(:name), :to => user.email)
  end

  # Deliver an invitation email
  def invitation_instructions(record)
    setup_mail(record, :invitation_instructions)
  end


  # Отправка пароля по почте
  def password
    setup_mail(record, :password)
  end

  def confirmation_instructions(record)
    setup_mail(record, :confirmation_instructions)
  end

  def reset_password_instructions(record)
    setup_mail(record, :reset_password_instructions)
  end

  def unlock_instructions(record)
    setup_mail(record, :unlock_instructions)
  end

  private

  # Configure default email options
  def setup_mail(record, action)
    default_url_options[:host] = Spree::Config[:site_url]
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

  # Setup a subject doing an I18n lookup. At first, it attemps to set a subject
  # based on the current mapping:
  #
  #   en:
  #     devise:
  #       mailer:
  #         confirmation_instructions:
  #           user_subject: '...'
  #
  # If one does not exist, it fallbacks to ActionMailer default:
  #
  #   en:
  #     devise:
  #       mailer:
  #         confirmation_instructions:
  #           subject: '...'
  #
  def translate(mapping, key)
    I18n.t(:"#{mapping.name}_subject", :scope => [:devise, :mailer, key],
      :default => [:subject, key.to_s.humanize])
  end
end
