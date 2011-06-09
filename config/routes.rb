Rails.application.routes.draw do
  root :to => "products#featured"

  devise_for :user,
  :controllers => { :sessions => 'user_sessions',
    :registrations => 'user_registrations',
    :passwords => "user_passwords",
    :invitations => "invitations" },
  :skip => [:unlocks, :omniauth_callbacks],
  :path_names => { :sign_out => 'logout'}


  devise_scope :user do
    get "user/confirm_phone", :to => "user_registrations#confirm_phone"
    get "user/resend_code", :to => "user_registrations#resend_code"
    get "user/resend_confirmation_token", :to => "user_registrations#resend_confirmation_token"
  end

  match "/change_password"=>"users#change_password", :via=>:get,  :as=>:change_password
  match "/update_password"=>"users#update_password", :via=>:post, :as=>:update_password

  resources :profiles

  match "/coupons(/:state)" => "coupons#index", :as => :coupons
  match "/coupons/:id/accept" => "coupons#gift", :as => :accept_gift

  match "friends" => "friends#index", :as => :friends

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

  match "cart/present" => "orders#present"

  #  match '/add_to_cart/:id' => "products#add_to_cart", :via=>:get, :as=>:add_to_cart

  get '/recently' => "products#recently"
  get '/current'  => "products#current"
  get '/featured' => "products#featured"

  match "/change_state/:id" => "locations#change_state"
  match "/user/deposit" => "user_deposit#new", :as=>:user_deposit

end

