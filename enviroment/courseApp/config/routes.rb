Rails.application.routes.draw do

  get '/404', to: 'errors#not_found', as:'not_found'
  get '/500', to: 'errors#internal_server_error', as: 'server_error'

  get  '/addCourses',  to: 'courses#new'
  post '/addCourses',  to: 'courses#create'

  get '/addCategory', to: 'categories#new'
  post '/addCategory',  to: 'categories#create'

  get '/addLocations', to: 'locations#new'
  post '/addLocations',  to: 'locations#create'

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

  root 'static_pages#home'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :courses

end
