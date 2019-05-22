Rails.application.routes.draw do
  
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'

  get 'courses/index'
  get 'sessions/new'

  resources :users do
    member do
      get :all_courses
    end
  end 

  resources :courses do
    member do
      get :categories
      post :category_add
      post :category_remove
      get :locations
      post :location_add
      post :location_remove
      get :users
      post :user_add
      post :user_remove
    end 
  end

  resources :locations do
    member do
      get :all_courses
    end
  end 

  resources :categories do
    member do
      get :all_courses
    end
  end 

  get 'users/new'
  
  root 'static_pages#home'
  get  '/contact', to: 'static_pages#contact'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

end
