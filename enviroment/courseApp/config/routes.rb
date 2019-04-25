Rails.application.routes.draw do
  root 'static_pages#home'
  get 'users/new'
  get '/courses', to: 'static_pages#courses'
  get  '/contact', to: 'static_pages#contact'
end
