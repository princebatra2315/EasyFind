Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'pages#index'
post '/profile' , to: 'profiles#create'
get  '/profile' ,  to: 'profiles#new'
get  '/find'    ,   to: 'profiles#show'
resources :profiles,  only: [:create, :destroy]
end
