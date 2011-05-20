# -*- coding: utf-8 -*-
UserRegistrationsController.class_eval do
  before_filter :init_regions, :only => [:new]


  # Повторная отправка подтверждения на мыло
  def resend_confirmation_token
    User.find_by_email(params[:email]).resend_confirmation_token
    redirect_to :back, :notice => t("notices.resend_confirmation_token")
  end

  def resend_code
    user = User.find_by_email(params[:email])
    user.send_new_mobile_code!
    redirect_to user_confirm_phone_path(:email => params[:email]), :notice => t("notices.resend_mobile_code", :phone => user.phone)
  end

  # Подтверждение мобильного
  def confirm_phone
    if params[:phone_confirm]
      user = User.find_by_email(params[:email])
      puts user.phone_confirm?
      redirect_to root_path, :notice => t("notices.phone_confirm_was_confirmed") if user.phone_confirm?
      if user.phone_confirm_key == params[:phone_confirm]
        user.phone_confirm!
        redirect_to edit_profile_path(:email => user.email), :notice => t("notices.successfully_phone_confirm")
      else
         flash[:notice] = t("notices.not_successfully_phone_confirm")
      end
    end
    @user = User.find_by_email(params[:email])
  end

  def create
    @user = build_resource(params[:user])
    @user.skip_confirmation! # Пропускаем пока активацию. Она будет после подтверждения телефона
    if resource.save
      resource.confirmed_at = nil
      resource.save
      set_flash_message(:notice, :signed_up)
      redirect_to user_confirm_phone_url(:email => resource.email)
#      sign_in_and_redirect(:user, @user)
    else
      @states = State.find(params[:user][:state_id]).country.states
      clean_up_passwords(resource)
      render_with_scope(:new)
    end
  end

  private

  def init_regions
    @states = Country.find_by_iso("RU").states
  end

end
