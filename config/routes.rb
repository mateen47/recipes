Rails.application.routes.draw do
	root 'pages#home'
	get 'pages/home', to: 'pages#home'
    
    get '/recipes', to:'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
