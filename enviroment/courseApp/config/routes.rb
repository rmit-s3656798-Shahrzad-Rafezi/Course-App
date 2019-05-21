Rails.application.routes.draw do

  get  '/courses',  to: 'courses#showCourses'

  get  '/addCourses',  to: 'courses#new'
  post '/addCourses',  to: 'courses#create'

  get '/category', to: 'categories#new'
  post '/category',  to: 'categories#create'

  get '/location', to: 'locations#new'
  post '/location',  to: 'locations#create'

  resources :categories

  resources :locations

  resources :courses

  resources :users do
    member do
      get :all_courses
    end
  end 

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
