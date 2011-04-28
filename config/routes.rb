Rails.application.routes.draw do
  devise_for :users do
    get "user/confirm_phone", :to => "user_registrations#confirm_phone"
    get "user/resend_code", :to => "user_registrations#resend_code"
    get "user/resend_confirmation_token", :to => "user_registrations#resend_confirmation_token"
  end

  resource :profile

  resources :locations do
    collection do
      get 'get_state'
    end
  end
end
