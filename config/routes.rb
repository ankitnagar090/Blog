Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"
  
  get '/stories/:id', to: redirect('/articles/1')
  
  direct :homepage do
   "https://rubyonrails.org"
  end

  resources :articles do
    
     get 'preview', on: :new
    
   resources :comments
   resources :formtests
  end
  

    #get "/articles", to: "articles#show"

  # Defines the root path route ("/")
  # root "articles#index"
end
