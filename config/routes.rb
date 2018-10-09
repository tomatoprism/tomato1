Rails.application.routes.draw do

  get 'discs/edit'
  get 'discs/update'
  get 'discs/destroy'
  get 'discs/create'
  get 'payments/show'
  get 'posts/create'
  get 'posts/destroy'
  get 'tracks/create'
  get 'tracks/update'
  get 'tracks/destroy'
  get 'artists/new'
  get 'artists/create'
  get 'artists/update'
  get 'artists/destroy'
  get 'artists/show'
  get 'histories/index'
  get 'histories/show'
  get 'categories/new'
  get 'categories/create'
  get 'categories/update'
  get 'categories/destroy'
  get 'carts/show'
  get 'reviews/create'
  get 'reviews/destroy'
  get 'favorites/index'
  get 'favorites/create'
  get 'favorites/destroy'


  root :top => 'tops#top'


  devise_for :admins
  devise_for :users

  namespace :admin do
      resources :users, only:[:index]
  end
  scope module: :public do
  	  resources :users, only:[:show, :edit, :update]
  end


  namespace :admin do
      resources :products
  end
  scope module: :public do
  	  resources :products do
  	  	resource :favorites, only:[:index, :create, :destroy]
  	    resource :reviews, only:[:create, :destroy]
  	    resource :discs, only:[:edit, :create, :update, :destroy]
    end
  end


  resources :carts, only:[:show]
  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'


  resources :category only:[:new, :create, :update, :destroy, :show]


  namespace :admin do
  	  resources :messeges, only:[:index, :show]
  end
  scope module: :public do
      resources :messeges, only:[:new, :create]
  end


  resources :historoies, only:[:index, :show]


  resources :artists, only:[:new, :create, :update, :destroy, :show]


  resources :tracks, only:[:create, :update, :destroy]


  resources :posts, only:[:create, :destroy]


  get "/payments" => "payments#show"


  get "/admins" => "admins#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
