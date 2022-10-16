Rails.application.routes.draw do
  resources :ventas
  resources :carritos
  #resources :usuarios
  resources :productos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '/usuarios' do
    post '/signup', to: 'usuarios#signup', as: "usuario"
    post '/login', to: 'usuarios#login'
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
