Rails.application.routes.draw do
  scope'(:locale)', locale:/#{I18n.available_locales.join("|")}/ do

    root 'product#index', as: 'home'

    resources :users, only: [:new, :create]
    get '/sign_up', to: 'users#new', as: :sign_up

    resources :sessions, only: [:new, :create, :destroy]
    get '/log_in', to: 'sessions#new', as: :log_in
    delete '/log_out', to: 'sessions#destroy', as: :log_out

    resources :product

    scope :admin do
      resources :category, controller: 'backoffice/category', as: 'admin_categories'
      resources :product, controller: 'backoffice/product', as: 'admin_products'
    end
  end
end
