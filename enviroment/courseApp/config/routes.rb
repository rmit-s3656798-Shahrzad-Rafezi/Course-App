Rails.application.routes.draw do

  get '/404', to: 'errors#not_found', as:'not_found'
  get '/500', to: 'errors#internal_server_error', as: 'server_error'

  get  '/addCourses',  to: 'courses#new'
  post '/addCourses',  to: 'courses#create'

  get '/category', to: 'categories#new'
  post '/category',  to: 'categories#create'

  get '/location', to: 'locations#new'
  post '/location',  to: 'locations#create'

  resources :categories do
    member do
      get :all_courses
    end
  end 

  resources :locations do
    member do
      get :all_courses
    end
  end 

  resources :courses


  get 'contact-me', to: 'messages#new', as: 'new_message'
  post 'contact-me', to: 'messages#create', as: 'create_message'

  # resources :courses do
  #   member do
  #     get :categories
  #     post :category_add
  #     post :category_remove
  #     get :locations
  #     post :location_add
  #     post :location_remove
  #     get :users
  #     post :user_add
  #     post :user_remove
  #   end
  # end

  # resources :locations do
  #   member do
  #     get :all_courses
  #   end
  # end

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

end
