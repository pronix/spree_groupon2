Rails.application.routes.draw do

  devise_scope :user do
    get "user/confirm_phone", :to => "user_registrations#confirm_phone"
    get "user/resend_code", :to => "user_registrations#resend_code"
    get "user/resend_confirmation_token", :to => "user_registrations#resend_confirmation_token"
  end

  resource :profile  

  resources :locations do
    collection do
      get 'get_state'
      get 'get_list'
    end
  end
  
  namespace :admin do
    resources :products do
      resources :conditions
      resources :features
    end
    resources :comments do
      collection do
        get :confirmed
      end
    end
  end

  resources :products do
    member do
      get 'conditions'
      get 'comments'
      get 'description'
      get 'add_comment'
    end
  end
#  match '/add_to_cart/:id' => "products#add_to_cart", :via=>:get, :as=>:add_to_cart
  get '/recently' => "products#recently"
  get '/current' => "products#current"
  match "/change_state/:id" => "locations#change_state"

end
