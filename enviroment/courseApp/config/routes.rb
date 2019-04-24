Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get 'static_pages/course'
  get 'static_pages/contact'
end
