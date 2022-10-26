Rails.application.routes.draw do
  resources :ventas
  #resources :usuarios
  resources :productos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '/usuarios' do
    post '/signup', to: 'usuarios#signup', as: "usuario"
    post '/login', to: 'usuarios#login'
  end
  
  scope '/carritos' do
    get '/:id', to: 'carritos#ver_carrito'
    post '/', to: 'carritos#create' 
    patch '/:id', to: 'carritos#agregar_producto'
    delete '/:id', to: 'carritos#quitar_producto'
  end 
end
