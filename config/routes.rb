Rails.application.routes.draw do 
  resources :contacts
  root 'pages#home'
  get '/about' => 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
