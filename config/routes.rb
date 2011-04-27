Rails.application.routes.draw do
  devise_for :users do
    get "user/confirm_phone", :to => "user_registrations#confirm_phone"
#    get "user/get_city", :to => "user_registrations#get_city"
    get "user/resend_code", :to => "user_registrations#resend_code"
  end

  resources :locations do
    collection do
      get 'get_state'
    end
  end
end
