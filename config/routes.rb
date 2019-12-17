Rails.application.routes.draw do
  root 'product#index', as: :authenticated_root

  get 'product/index'
  get 'product/show'

  resources :product do
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
