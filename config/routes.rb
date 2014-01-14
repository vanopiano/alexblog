RailsApp::Application.routes.draw do

  resources :categories

  match 'posts/page/:page' => 'posts#index'
  resources :posts    

  resources :comments, :only => [:create, :destroy]

  get "categories/index"
  get "categories" => "categories#index"  
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" } do
    get "/signup" => "devise/registrations#new", :as => 'sign_up'
    get '/logout' => 'devise/sessions#destroy', :as => 'sign_out'
    get '/login' => "devise/sessions#new", :as => 'log_in'
  end 
  resources :users

  root :to => 'posts#index'
end
