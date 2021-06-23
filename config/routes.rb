Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

  root 'homes#top'
  get 'home/about' => "homes#about"

  resources :customers, only: [:show, :edit, :update] do
    delete 'cart_items' => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :create, :update, :destroy]
    member do
      get 'quit'
      patch 'withdraw'
    end
  end

  resources :items, only: [:index, :show]

  post 'orders/confirm' => "orders#confirm"
  get 'orders/confirm' => "orders#confirm"
  get 'orders/complete' => "orders#complete"
  resources :orders, only: [:index, :show, :new, :create]

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]


  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      resources :order_items, only: [:update]
    end
   end
end







  # ====================controller作成時に自動生成されたルーティング================================
  # namespace :admin do
  #   get 'genres/index'
  #   get 'genres/edit'
  # end
  # namespace :admin do
  #   get 'items/index'
  #   get 'items/new'
  #   get 'items/show'
  #   get 'items/edit'
  # end
  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :admin do
  #   get 'orders/index'
  #   get 'orders/show'
  # end
  # get 'addresses/index'
  # get 'addresses/edit'
  # get 'orders/index'
  # get 'orders/new'
  # get 'orders/show'
  # get 'orders/confirm'
  # get 'orders/complete'
  # get 'cart_items/index'
  # get 'items/index'
  # get 'items/show'
  # get 'customers/show'
  # get 'customers/edit'
  # get 'customers/quit'
  # get 'homes/top'
  # get 'homes/about'
  # devise_for :admins
  # devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
