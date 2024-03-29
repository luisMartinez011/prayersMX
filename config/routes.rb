Rails.application.routes.draw do
  devise_for :usuarios
  
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :compras

  get '/compras', to: 'compras#show'
  #resources :usuarios
  resources :productos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '/usuarios' do
    post '/signup', to: 'usuarios#signup'
    post '/login', to: 'usuarios#login'
  end
  
  scope '/carritos' do
    get '/:id', to: 'carritos#ver_carrito'
    patch '/:id', to: 'carritos#agregar_producto'
    delete '/:id', to: 'carritos#quitar_producto'

    delete '/comprar/:id', to: 'carritos#comprar'
  end 
end
