Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  get 'order/show'
  get 'order/index'
  get 'order/new'
  scope'(:locale)', locale:/#{I18n.available_locales.join("|")}/ do

    root 'product#index', as: 'home'

    resources :users, only: [:new, :create]
    get '/sign_up', to: 'users#new', as: :sign_up

    resources :sessions, only: [:new, :create, :destroy]
    get '/log_in', to: 'sessions#new', as: :log_in
    delete '/log_out', to: 'sessions#destroy', as: :log_out


    get 'carts/:id' => "carts#show", as: "cart"
    delete 'carts/:id' => "carts#destroy"

    post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
    post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"
    post 'cart_items' => "cart_items#create"
    get 'cart_items/:id' => "cart_items#show", as: "cart_item"
    delete 'cart_items/:id' => "cart_items#destroy"

    resources :product do
      resources :comments
      collection do
        get :min_price
        get :max_price
        get :sort_new
        get :sort_old
      end
    end

    resources :orders

    scope :admin do
      resources :category, controller: 'backoffice/category', as: 'admin_categories'
      resources :product, controller: 'backoffice/product', as: 'admin_products'
    end
  end
end
