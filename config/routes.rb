Rails.application.routes.draw do
  get 'users/index'

  devise_for :users,  :controllers => { :shows => "devise/my_devise/shows"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'pages#index'
match '/users',   to: 'users#index',   via: 'get'
post '/profile' , to: 'profiles#create'
get  '/profile' ,  to: 'profiles#new'
get  '/find'    ,   to: 'profiles#show'
#put  '/show'   ,  to: 'shows#show'
resources :profiles,  only: [:create, :destroy]
end
