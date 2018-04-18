Rails.application.routes.draw do
  get 'users/index'

  devise_for :users,  :controllers => { :shows => "devise/my_devise/shows"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  match '/users',    to: 'users#index',   via: 'get'
  post '/profile' ,  to: 'profiles#create'
  get  '/profile' ,  to: 'profiles#new'
  get  '/profiles' ,   to: 'profiles#index'
  
  get  '/profile/edit/:id' ,  to: 'profiles#edit'
  post  '/profile/edit/:id' ,  to: 'profiles#update'

  post '/profiles/filter' ,  to: 'profiles#filter' 
  get  '/about',     to: 'pages#about'
  get  '/contact',   to: 'feedbacks#new'
  get  '/help',       to: 'pages#help'
  get  '/faq',       to: 'pages#faq'
  post  '/contact',  to: 'feedbacks#create'
  get   '/feedback', to:  'feedbacks#index'
  
end
